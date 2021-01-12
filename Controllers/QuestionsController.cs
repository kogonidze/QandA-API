using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using QandA.Data;
using QandA.Hubs;
using QandA.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QandA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionsController : ControllerBase
    {
        private readonly IDataRepository _dataRepository;
        private readonly IHubContext<QuestionsHub> _questionHubContext;

        public QuestionsController(IDataRepository dataRepository, IHubContext<QuestionsHub> questionHubContext)
        {
            _dataRepository = dataRepository;
            _questionHubContext = questionHubContext;
        }

        [HttpGet]
        public async Task<IEnumerable<QuestionGetManyResponse>> GetQuestions(string search, bool includeAnswers, int page = 1, int pageSize = 20)
        {
            if (string.IsNullOrEmpty(search))
            {
                if (includeAnswers)
                {
                    return await _dataRepository.GetQuestionsWithAnswers();
                }
                else
                {
                    return await _dataRepository.GetQuestions();
                }
            }
            else
            {
                return await _dataRepository.GetQuestionsBySearchWithPaging(search, page, pageSize);
            }
        }

        [HttpGet("unanswered")]
        public async Task<IEnumerable<QuestionGetManyResponse>> GetUnansweredQuestions()
        {
            return await _dataRepository.GetUnansweredQuestionsAsync();
        }

        [HttpGet("{questionId}")]
        public async Task<ActionResult<QuestionGetSingleResponse>> GetQuestion(int questionId)
        {
            var question = await _dataRepository.GetQuestion(questionId);

            if (question == null)
            {
                return NotFound();
            }

            return question;
        }

        [HttpPost]
        public async Task<ActionResult<QuestionGetSingleResponse>> 
            PostQuestion(QuestionPostRequest questionPostRequest)
        {
            var savedQuestion = await _dataRepository.PostQuestion(new QuestionPostFullRequest
            {
                Title = questionPostRequest.Title,
                Content = questionPostRequest.Content,
                UserId = "1",
                UserName = "bob.test@test.com",
                Created = DateTime.UtcNow
            });

            return CreatedAtAction(nameof(GetQuestion), new { questionId = savedQuestion.QuestionId }, savedQuestion);
        }

        [HttpPut("{questionId}")]
        public async Task<ActionResult<QuestionGetSingleResponse>>
            PutQuestion(int questionId, QuestionPutRequest questionPutRequest)
        {
            var question = await _dataRepository.GetQuestion(questionId);

            if (question == null)
            {
                return NotFound();
            }

            questionPutRequest.Title = string.IsNullOrEmpty(questionPutRequest.Title) ? 
                question.Title : questionPutRequest.Title;

            questionPutRequest.Content = string.IsNullOrEmpty(questionPutRequest.Content) ?
                question.Content : questionPutRequest.Content;

            var savedQuestion = await _dataRepository.PutQuestion(questionId, questionPutRequest);

            return savedQuestion;
        }

        [HttpDelete("{questionId}")]
        public async Task<ActionResult> DeleteQuestion(int questionId)
        {
            var question = await _dataRepository.GetQuestion(questionId);
            if (question == null)
            {
                return NotFound();
            }

            await _dataRepository.DeleteQuestion(questionId);

            return NoContent();
        }

        [HttpPost("answer")]
        public async Task<ActionResult<AnswerGetResponse>>
            PostAnswer(AnswerPostRequest answerPostRequest)
        {
            var questionExists = await _dataRepository.QuestionExists(answerPostRequest.QuestionId.Value);

            if (!questionExists)
            {
                return NotFound();
            }

            var savedAnswer = _dataRepository.PostAnswer(new AnswerPostFullRequest
            {
                QuestionId = answerPostRequest.QuestionId.Value,
                Content = answerPostRequest.Content,
                UserId = "1",
                UserName = "bob.test@test.com",
                Created = DateTime.UtcNow
            });

            await _questionHubContext.Clients.Group(
                $"Question-{answerPostRequest.QuestionId.Value}")
                .SendAsync("ReceiveQuestion",
                _dataRepository.GetQuestion(answerPostRequest.QuestionId.Value));

            return savedAnswer;
        }
    }
}
