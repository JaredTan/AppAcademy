export const SWITCH_CURRENCY = "SWITCH_CURRENCY";

const selectCurrency = (baseCurrency, rates) => ({
  type: SWITCH_CURRENCY,
  baseCurrency: baseCurrency,
  rates: rates
});

export default selectCurrency;

// window.selectCurrency = selectCurrency;
//
// const selectCurrency = (baseCurrency, rates) => {
//   return {
//     type: "SWITCH_CURRENCY",
//     baseCurrency: baseCurrency,
//     rates: rates
//   };
// };
//
// export default selectCurrency;
