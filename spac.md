## 測試案例：Trend Vision One for Service Providers 更新流程

1. 開啟瀏覽器並進入以下網址：  
   `https://ie85v.login-tmp.trendmicro.com/authenticate/operator/false`
2. 在帳號欄位輸入：`Admin`
3. 在密碼欄位輸入：`V1MSP@qa`
4. 點選登入按鈕。
5. 登入後，點選 `view detail` 按鈕。
6. 確認彈出視窗內容為：  
   ```
   Trend Vision One for Service Providers offers valuable insight into your customers' security posture, discovers and prioritizes asset vulnerabilities, and minimizes their organizational risk exposure. With advanced XDR capabilities, this unified solution enables incident response and threat hunting using detection models, event correlation, and data analysis. Trend Vision One for Service Providers also enables automation and management of detection and response processes seamlessly across the endpoint, data, identity, mobile, cloud, network, and email layers of your customers' environments.
   ```
7. 點選 `update now` 按鈕。
8. 確認彈出視窗內容為：  
   ```
   Update to Trend Vision One for Service Providers  
   By continuing with the update, you gain access to Trend Vision One for Service Providers.

   Before updating, please note the following:

   - The update is irreversible.
   - You must update your administrator account to email address format.
   - Other administrator accounts must update their accounts to email address format on their next sign-in to Licensing Management Platform.
   - Your existing Remote Manager and Licensing Management Platform are embedded in the Trend Vision One for Service Providers console.
   - The Trend Vision One for Service Providers console appears in dark mode and is available in English only.
   ```
9. 測試完畢。

## GitHub Actions 工作流程：Playwright 測試

### 在 Push/Pull Request 時執行測試