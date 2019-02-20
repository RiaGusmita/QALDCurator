package webapp.services;


import org.aksw.qa.commons.datastructure.Question;
import webapp.model.Dataset;
import webapp.model.Questions;
import java.util.List;
import java.util.Map;


public interface QuestionsService {

    String saveQuestions(Questions questions);

    List<Questions> getAllQuestions();
    List<Questions> findAllQuestionsByDatasetQuestion_Id(long id);
    List<Questions> findQuestionsByDatasetQuestion_Id(long id);
    List<Questions> findQuestionsByQuestionSetId(long id);
    List<Questions> findQuestionsByDatasetQuestionIdAndQuestionSetId(long setId, long id);
    List<Questions> findAllQuestionsByDatasetQuestion_IdAndActivation(long id,boolean activation);
    List<Questions> findByDatasetQuestion_IdAndVersionAndRemoved(long id, int version, boolean removed);
    Questions findDistinctById(long id);
    Map<String,List<String>> generateMergingTranslationsMap(long setId, long id);
}
