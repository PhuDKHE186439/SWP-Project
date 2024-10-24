<%-- 
    Document   : MakeFeedBackForCustomer
    Created on : Oct 23, 2024, 7:08:40 AM
    Author     : My Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="header1.jsp"></jsp:include>

        </head>
        <body>
            <div class="container">
                <div class="row justify-content-center" style="margin: 30px">
                    <div class="col-12 col-md-12 text-center">
                        <div class="tab-pane" id="Feedback">
                            <div class="text-center">
                                <h3>Change Password</h3>
                            </div>
                            <p style="color: teal">${requestScope.message}</p>
                        <form class="" action="feedbackforcustomer" method="post">
                            <div class="">
                                <div class="form-group row">
                                </div>
                                <div class="form-group row">
                                    <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Type Of Feedback</label>
                                    <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                        <select class="form-control" id="feedbacktype" name="feedbacktype" required>
                                            <option value="" selected disabled>Type Of Feedback</option>
                                            <option value="Services">Services</option>
                                            <option value="Bugs">Bugs</option>
                                            <option value="Employees">Employees</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Description Detail</label>
                                    <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                        <textarea id="myTextarea" class="form-control" maxlength="500"  oninput="updateCount()" type="text" rows="8" cols="100" value="" name="feedback" style="resize: vertical"></textarea>
                                        <p id="charCount">500 characters remaining</p>

                                    </div>
                                </div>
                            </div>
                            <script>
                                function updateCount() {
                                    const textarea = document.getElementById('myTextarea');
                                    const maxLength = textarea.maxLength;
                                    const currentLength = textarea.value.length;
                                    const remaining = maxLength - currentLength;

                                    // Update the paragraph text with the remaining characters
                                    document.getElementById('charCount').textContent = remaining + ' characters remaining';
                                }
                            </script>
                            <div class="row">
                                <div class="text-center">
                                    <button type="submit" class="btn">Send</button>
                                    <button type="reset" class="btn-secondry">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer1.jsp"></jsp:include>
    <style>
        #Feedback {
            border: 2px solid #000; /* Adjust the thickness and color as needed */
            padding: 15px;         /* Space inside the box */
            margin: 10px;         /* Space outside the box */
            border-radius: 5px;   /* Optional: rounded corners */
            background-color: #f9f9f9; /* Optional: background color */
        }
    </style>
    <script>
        function validateForm(event) {
            var select = document.getElementById("feedbacktype");
            if (select.value === "") {
                event.preventDefault();
            }
        }
    </script>
</html>
