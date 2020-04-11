document.addEventListener('turbolinks:load', () => {
    const progressDiv = document.querySelector('.progress');
    const progressBar = document.querySelector('.progress-bar');

    if (progressDiv && progressBar) {
        progressBar.style.width = `${progressDiv.dataset.percent}%`
    }
}); 