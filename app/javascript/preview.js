document.addEventListener('DOMContentLoaded',function(){
const Form = document.getElementById('form');
const previews = document.getElementById('previews');
if (!Form) return null;
const fileField = document.getElementById('item-image');
fileField.addEventListener('change',function(e){
  const alreadyPreview = document.querySelector('.preview');
  if(alreadyPreview){
    alreadyPreview.remove();
  };
 const file = e.target.files[0];
 const blob = window.URL.createObjectURL(file);
 const previewWrapper = document.createElement('div');
 previewWrapper.setAttribute('class','preview');
 const previewImage = document.createElement('img');
 previewImage.setAttribute('class','preview_image')
 previewImage.setAttribute('src',blob);
 previewWrapper.appendChild(previewImage);
 previews.appendChild(previewWrapper);
});
});