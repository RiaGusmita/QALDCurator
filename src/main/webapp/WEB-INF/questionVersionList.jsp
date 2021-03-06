<%@include file="templates/layout.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12  pt-2">
            <span class="h4">Version history
            <a href="/questionslist/${Set}"><button class="ml-2 btn btn-success btn-sm">Back to question list</button></a>
            </span>
            <div class="table-responsive">


                <table id="table_id" class="display" style="width:100%"> <!--  class="display" style="width:100%"-->
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Question</th>
                        <th>Anotator</th>
                        <th class="text-center">Version Nr.</th>
                        <th class="text-center">Active</th>
                        <c:if test="${User.role =='ADMIN'}">
                            <th class="text-center">Delete</th>
                        </c:if>


                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${Questions}" var="question">
                        <tr class="dataset-row" id="${question.id}">
                            <form id="form_${question.id}" action="/deleteQuestionVersion/${Set}/${Id}" method="POST"
                                  onSubmit="return confirm('Are you sure you wish to delete?')">
                                <td>${question.id}</td>

                                <td><c:out value="${question.getDefaultTranslation()}"></c:out></td>

                                <td><c:out value=" ${question.anotatorUser.email}"></c:out></td>
                                <td class="text-center"><c:out value="${question.version}"></c:out></td>


                                <c:choose>
                                    <c:when test="${question.activeVersion}">
                                        <c:set var="wasActive" value="${question.id}"/>

                                        <td class="form-check text-center"><input type="radio" class="form-check-input"
                                                                                  id="version_${question.id}"
                                                                                  name="versionControl"
                                                                                  onchange="changeActiveVersion(${question.id})"
                                                                                  checked></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="form-check text-center"><input type="radio" class="form-check-input"
                                                                                  id="version_${question.id}"
                                                                                  name="versionControl"
                                                                                  onchange="changeActiveVersion(${question.id})">
                                        </td>
                                    </c:otherwise>
                                </c:choose>


                                <c:if test="${User.role =='ADMIN'}">


                                    <td class="text-center">
                                        <button type="submit" class="btn btn-danger btn-sm" id="deleteId"
                                                name="deleteId" value="${question.id}">Delete
                                        </button>


                                    </td>

                                </c:if>
                            </form>
                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
                <form id="versionForm" action="/questionVersionList/${Set}/${Id}" method="POST">
                    <input type="hidden" id="nowActive" name="nowActive" value="">
                    <input type="hidden" id="wasActive" name="wasActive" value="${wasActive}">
                </form>
                <c:if test="${(User.role =='ADMIN') and Questions.size()>1}">
                    <a href="/merge/${Set}/${Id}">
                        <button class="btn btn-outline-info btn-sm">Merge</button>
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script>

    function changeActiveVersion(nowActive) {
        $("#nowActive").val(nowActive);
        var wasActive = Number(document.getElementById("wasActive").value);
        console.log(wasActive);
        console.log(nowActive);
        document.getElementById("versionForm").submit();
    }

</script>
<%@include file="templates/footer.jsp" %>

