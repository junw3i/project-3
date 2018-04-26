$( document ).ready(() => {
  const alerts = $(".notice");
  for (alert=0; alert<alerts.length; alert++) {
    M.toast({html: alerts[alert].textContent});
  }
});
