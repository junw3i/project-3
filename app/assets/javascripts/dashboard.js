
$(document).on('turbolinks:load', () => {
  let dates = $(".datetime");
  for (i=0; i<dates.length; i++) {
    let cleanTime = (dates[i].textContent).trim();
    console.log(cleanTime);
    let local_date = moment.utc(cleanTime);
    console.log(local_date);
    dates[i].textContent = local_date.local().format("DD MMM YYYY [at] hh:mm a (ddd)");
  }
});
