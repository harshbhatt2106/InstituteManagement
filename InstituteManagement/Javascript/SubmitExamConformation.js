function myFunction() {
    let text;
    let message = confirm("Are You Conform Submit Exam");
    if (message) {
        text = "Yes";
    } else {
        text = "No";
    }
    document.getElementById('<%= ConfromationforExamSubmission.ClientID %>').value = text;
}
function updateTimerValues() {
    alert("Your Time is Over And Exam is Loss.");
}