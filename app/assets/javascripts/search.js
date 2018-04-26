
$( document ).ready(() => {
  let search_bar = $("#search-input");

  const updateList = () => {
    // console.log("key pressed!");
    input = $("#search-input")[0].value;
    filter = input.toUpperCase();
    let li = $(".pat-data");

    for (i = 0; i < li.length; i++) {

      a = li[i].getElementsByTagName("a")[0].innerHTML;
      if (a.toUpperCase().indexOf(filter) > -1) {
          li[i].style.display = "";
      } else {
          li[i].style.display = "none";
      }
  }

  };
  search_bar.keyup(() => {
    updateList();
  })
});
