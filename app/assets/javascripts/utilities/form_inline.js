document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInLineLinkHandlers)

  var errors = document.querySelector('.resource-errors')

  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInLineHandler(resourceId)
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInLineHandler(testId)
}


function formInlineHandler(testId) {
    const link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`);
    const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`);
    const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`);

    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide');
        formInline.classList.remove('hide');
        link.textContent = 'Cancel';
    } else {
        testTitle.classList.remove('hide');
        formInline.classList.add('hide');
        link.textContent = 'Edit';
    }
}