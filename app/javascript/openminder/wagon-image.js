  function insertWagonImage () {
    const wagonImageDiv = document.querySelector(".special-photo-wagon");
    let photoId = document.querySelector(".opinion-track-selected").dataset.photoId;
    wagonImageDiv.innerHTML = `
      <img src="/assets/${photoId}" alt="">
      `;
  }


  function hidePlayer () {
    const wagonPlayer = document.querySelector("#player");
    wagonPlayer.classList.add("hidden");
  }
  export { insertWagonImage };
