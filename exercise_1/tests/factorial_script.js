// 
// factorial_script.js
// 
// Note: The current version of this script is not using Playwright framework for UI automation testing,
//       but it is included for a potential future UI testing enhancments

const { chromium } = require('@playwright/test');

async function verifyCalculator() {
  const url = 'https://qainterview.pythonanywhere.com/';
  const browser = await chromium.launch();
  const context = await browser.newContext();
  const page = await context.newPage();

  for (let number = 10; number <= 100; number++) {
    const expectedResult = calculateFactorial(number);

    try {
      await page.goto(url);
      await page.fill('#number', number.toString());
      await page.click('#getFactorial');
      await page.waitForSelector('#resultDiv');

      const calculatedResult = await page.textContent('#resultDiv');

      console.log(`Factorial of ${number}: Expected: ${expectedResult}, Calculated: ${calculatedResult}`);

      if (calculatedResult === `The factorial of ${number} is: ${expectedResult}`) {
        console.log(`Factorial of ${number} is correct`);
      } else {
        console.log(`Factorial of ${number} is incorrect`);
      }
    } catch (error) {
      console.log(`Error occurred while retrieving factorial for ${number}:`, error);
    }
  }

  await browser.close();
}

function calculateFactorial(number) {
  let factorial = BigInt(1);
  for (let i = 2; i <= number; i++) {
    factorial *= BigInt(i);
  }

  if (number <= 21) {
    return factorial.toString();
  } else {
    return Number(factorial.toString()).toExponential();
  }
}

// Start the verification process
verifyCalculator();
