# 根據以下內容寫成robotframework python語言 搭配 selenium

# 1. 原始playwright typescript 測試案例
'''
import { test, expect } from '@playwright/test';

test('lmpForItops', async ({ page }) => {
  await page.goto('https://signin-int.visionone.trendmicro.com/');
  await page.locator('[data-test="_IAM_USERNAME_INPUT_"]').dblclick();
  await page.locator('[data-test="_IAM_USERNAME_INPUT_"]').fill('ol_t2_disti_penny@mailsac.com');
  await page.locator('[data-test="_IAM_SIGN_IN_BTN_"]').click();
  await page.locator('[data-test="_IAM_PASSWORD_INPUT_"]').dblclick();
  await page.locator('[data-test="_IAM_PASSWORD_INPUT_"]').fill('V1MSP@qa');
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByRole('button', { name: 'Close' }).click();
  await page.locator('#uic_userinfo_4').click();
  await expect(page.locator('div').filter({ hasText: /^Usage and Billing$/ })).toBeVisible();
  await page.locator('span').filter({ hasText: 'Usage and Billing' }).first().click();;
  await expect(page.locator('[data-test="NAV_ICON_Licensing_Management_Platform"]')).toContainText('Billing Reports');
});

test('lmpForMspc', async ({ page }) => {
  await page.goto('https://signin-int.visionone.trendmicro.com/');
  await page.locator('[data-test="_IAM_USERNAME_INPUT_"]').dblclick();
  await page.locator('[data-test="_IAM_USERNAME_INPUT_"]').fill('beta_de_reports@mailsac.com');
  await page.locator('[data-test="_IAM_SIGN_IN_BTN_"]').click();
  await page.locator('[data-test="_IAM_PASSWORD_INPUT_"]').dblclick();
  await page.locator('[data-test="_IAM_PASSWORD_INPUT_"]').fill('V1MSP@qa');
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByRole('button', { name: 'Close' }).click();
  await page.locator('#uic_userinfo_4').click();
  await expect(page.locator('div').filter({ hasText: /^Usage and Billing$/ })).toBeVisible();
  await page.locator('span').filter({ hasText: 'Usage and Billing' }).first().click();;
  await expect(page.locator('[data-test="NAV_ICON_Licensing_Management_Platform"]')).toContainText('Licensing Management Platform');
});

test('verifyPartnerOnboardingDateIsVisible', async ({ page }) => {
  await page.goto('https://signin-int.visionone.trendmicro.com/');
  await page.locator('[data-test="_IAM_USERNAME_INPUT_"]').fill('Beta_JP@mailsac.com');
  await page.locator('[data-test="_IAM_SIGN_IN_BTN_"]').click();
  await page.locator('[data-test="_IAM_PASSWORD_INPUT_"]').click();
  await page.locator('[data-test="_IAM_PASSWORD_INPUT_"]').fill('V1MSP@qa');
  await page.getByRole('button', { name: 'Continue' }).click();
  await page.getByRole('button', { name: 'Sign in' }).click();
  await page.getByRole('button', { name: 'Close' }).click();
  await page.getByRole('button', { name: 'Close' }).click();
  await page.locator('div').filter({ hasText: /^Usage and Billing$/ }).click();
  await page.locator('[data-test="NAV_ICON_Licensing_Management_Platform"]').click();
  await page.locator('iframe[name="__ACM_APP_CONTAINER"]').contentFrame().locator('iframe[name="loginIframe"]').contentFrame().getByRole('link', { name: 'active partner(s)' }).click();
  await expect(page.locator('iframe[name="__ACM_APP_CONTAINER"]').contentFrame().locator('iframe[name="loginIframe"]').contentFrame().locator('thead')).toContainText('Onboarding Date');
});

'''
# 2. 請將上述的locator 轉換時都使用xpath去轉換
