<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Modal -->
<div class="modal fade" id="editFeedbackModal" tabindex="-1" aria-labelledby="editFeedbackModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editFeedbackModalLabel">Edit Feedback</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="updateFeedback" method="post">
          <input type="hidden" name="feedbackID" id="feedbackID" value="">
          <div class="mb-3">
              <label for="message" class="form-label">Message</label>
              <input type="text" class="form-control" id="message" name="message" value="" required>
          </div>
          <div class="mb-3">
              <label for="passengerID" class="form-label">Passenger ID</label>
              <input type="number" class="form-control" id="passengerID" name="passengerID" value="" required>
          </div>
          <div class="mb-3">
              <label for="submissionDate" class="form-label">Submission Date</label>
              <input type="date" class="form-control" id="submissionDate" name="submissionDate" value="" required>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update Feedback</button>
      </div>
    </div>
  </div>
</div>