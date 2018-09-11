  function insertWagonImage () {
    const wagonImageDiv = document.querySelector(".special-photo-wagon");
    if (wagonImageDiv) {
    let photoId = document.querySelector(".opinion-track-selected").dataset.photoId;
    wagonImageDiv.innerHTML = `
      <img src="/assets/${photoId}" alt="">
      `;
    }
  }

  function growScrollbar () {
    const wagonScrollbar = document.querySelector(".scrollbar");
    const playerId = document.querySelector(".tracks-js").dataset.opinionId;
    if (playerId == 18) {
      wagonScrollbar.classList.add("grow-scrollbar");
    }
  }

  export { insertWagonImage, growScrollbar };
