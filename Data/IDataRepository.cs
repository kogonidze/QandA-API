using QandA.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QandA.Data
{
    public interface IDataRepository
    {
        Task<IEnumerable<QuestionGetManyResponse>> GetQuestions();
        IEnumerable<QuestionGetManyResponse> GetQuestionsBySearch(string search);
        IEnumerable<QuestionGetManyResponse> GetUnansweredQuestions();
        Task<QuestionGetSingleResponse> GetQuestion(int questionId);
        Task<bool> QuestionExists(int questionId);
        AnswerGetResponse GetAnswer(int answerId);

        Task<QuestionGetSingleResponse> PostQuestion(QuestionPostFullRequest question);
        Task<QuestionGetSingleResponse> PutQuestion(int questionId, QuestionPutRequest question);

        Task DeleteQuestion(int questionId);
        AnswerGetResponse PostAnswer(AnswerPostFullRequest answer);

        Task<IEnumerable<QuestionGetManyResponse>> GetQuestionsWithAnswers();

        Task<IEnumerable<QuestionGetManyResponse>> GetQuestionsBySearchWithPaging(string search, int pageNumber, int pageSize);

        Task<IEnumerable<QuestionGetManyResponse>> GetUnansweredQuestionsAsync();
    }
}
