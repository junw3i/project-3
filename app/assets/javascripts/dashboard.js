
$(document).on('turbolinks:load', () => {

  $('.modal').modal();

  let dates = $(".datetime");
  for (i=0; i<dates.length; i++) {
    let cleanTime = (dates[i].textContent).trim();
    let local_date = moment.utc(cleanTime);
    dates[i].textContent = local_date.local().format("DD MMM YYYY [at] hh:mm a (ddd)");
  }
});
