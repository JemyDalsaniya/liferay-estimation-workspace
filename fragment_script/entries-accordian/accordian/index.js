   const dropzoneToggle = document.getElementById('toggleDropzone');
    const dropzoneContent = document.getElementById('contentDropzone');
		  dropzoneToggle.addEventListener('click', function () {
      dropzoneContent.classList.toggle('hidden');
    });

    const form = document.querySelector('form');
    const textarea = document.getElementById('editor');
    const displayValue = document.getElementById('displayValue');

    form.addEventListener('submit', function (event) {

      event.preventDefault();

      const textareaValue = textarea.value;

      displayValue.textContent = 'Description: ' + textareaValue;
    });
