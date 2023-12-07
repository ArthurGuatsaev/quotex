import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quotex/lessons/domain/model/lesson.dart';

class LessonApiClient {
  static Future<List<Lesson>> getLessons(
      StreamController<String> errorController) async {
    try {
      // final x = Dio(BaseOptions(
      //   connectTimeout: const Duration(seconds: 7),
      //   receiveTimeout: const Duration(seconds: 7),
      // ));
      // final response = await x.get(
      //     'https://$apiDomain/api/v2/lessons/?lang=en&token=b19fa3ad-b80f-49c9-9178-00a64cf5b57c');
      // if (response.statusCode == 200) {
      //   final lessons = response.data!['results'] as List<dynamic>;
      //   final newLesson =
      //       lessons.map((e) => e as Map<String, dynamic>).toList();
      //   final list = newLesson.map((e) {
      //     final term = Lesson.fromMap(e);
      //     return term;
      //   }).toList();
      //   return list;
      // }
      return mapLessons;
    } on DioException catch (_) {
      errorController.add('No internet connection');
      return [];
    } catch (e) {
      return [];
    }
  }
}

final mapLessons = [
  Lesson(
    id: 0,
    description: """
Options trading is a popular and versatile strategy that allows investors to profit from price movements in financial markets without necessarily owning the underlying asset. Among the various types of options available, call and put options are two fundamental components. In this comprehensive guide, we will delve into the world of call and put options to help you understand how they work and how you can utilize them in your trading strategies.
 
What are Call Options?
Call options provide the buyer with the right, but not the obligation, to buy a specific underlying asset at a predetermined price (known as the strike price) within a specified time period (known as the expiration date). This right is acquired by paying a premium to the seller of the call option. If the price of the underlying asset rises above the strike price before the option expires, the buyer can exercise the option and profit from the price difference.
 
Call options are often used by investors who anticipate an increase in the price of the underlying asset. By purchasing call options, investors can participate in potential upside movements while limiting their downside risk to the premium they paid for the options.
 
What are Put Options?
Put options, on the other hand, give the buyer the right, but not the obligation, to sell the underlying asset at a predetermined price within a specified time period. Similar to call options, put options are acquired by paying a premium to the seller. If the price of the underlying asset falls below the strike price before the option expires, the buyer can exercise the option and profit from the price difference.
 
Put options are often used by investors who anticipate a decline in the price of the underlying asset. By purchasing put options, investors can profit from potential downside movements while limiting their risk to the premium paid.
 
Key Factors in Options Trading
Strike Price: This is the predetermined price at which the buyer of the option can exercise their right to buy (call option) or sell (put option) the underlying asset.
 
Expiration Date: Options have a limited lifespan, known as the expiration date. After this date, the options become worthless. It is crucial to choose an expiration date that aligns with your trading strategy.
 
Premium: The premium is the price paid by the buyer to acquire the option. It represents the cost of buying the right to participate in potential price movements of the underlying asset.
 
Benefits and Risks of Options Trading
Options trading offers several benefits, including flexibility, leverage, and the ability to profit in both bullish and bearish market conditions. However, it is essential to recognize the risks associated with options trading. Options are time-sensitive and subject to price decay as the expiration date approaches. Furthermore, options trading involves complexities that require careful analysis and understanding of market dynamics.
 
Conclusion
Understanding call and put options is crucial for any investor looking to engage in options trading strategies. Call options provide the right to buy, while put options provide the right to sell the underlying asset. By grasping the principles of strike price, expiration date, and premium, investors can make informed decisions when employing options as part of their overall investment approach. Remember to weigh the potential benefits against the risks involved and always conduct thorough research before engaging in options trading.
""",
    title: 'Understanding Call and Put Options: A Comprehensive Guide',
    image: 'assets/images/lesson_one.jpg',
    isFavorite: false,
    level: 'Beginners',
    quality: 0,
    status: LessonStatus.open,
  ),
  Lesson(
    id: 1,
    description: """
Developing a well-defined financial plan is essential to achieving your short-term and long-term financial objectives. A comprehensive financial plan serves as a roadmap for managing your income, expenses, investments, and savings. Using these tried-and-true steps, this article will guide you through the process of creating a personalized financial plan that aligns with your goals.
 
Step 1: Define Your Financial Goals
The first step in creating a financial plan is to clearly define your financial goals. Are you looking to buy a house, save for retirement, pay off debt, or start a business? By identifying your objectives, you can tailor your plan to prioritize and allocate resources accordingly.
 
Step 2: Assess Your Current Financial Situation
Evaluating your current financial situation is crucial in determining where you stand and what steps you need to take to reach your goals. Take stock of your income, expenses, assets, and liabilities. Analyze your spending habits, debt levels, and savings. This assessment will give you a baseline understanding of your financial health.
 
Step 3: Create a Budget
Developing a budget is the cornerstone of any effective financial plan. A budget helps you track and control your spending, ensuring you allocate resources toward your goals. Calculate your monthly income and categorize your expenses into fixed and variable costs. Identify areas where you can cut back and allocate those savings toward your financial goals.
 
Step 4: Establish an Emergency Fund
An emergency fund is a critical component of any financial plan. Aim to save three to six months' worth of living expenses in a readily accessible account. This fund provides a safety net in case of unexpected emergencies or job loss. Regularly contribute to your emergency fund to maintain its viability.
 
Step 5: Evaluate and Manage Debt
Managing and reducing debt is vital for achieving financial stability. Compile a list of all your outstanding debts, including credit cards, loans, and  mortgages. Create a plan to pay off high-interest debts first while making minimum payments on others. Consider debt consolidation or refinancing options to streamline your debt repayment process.
 
Step 6: Invest for the Future
Investing is an integral part of wealth creation and long-term financial success. Determine your risk tolerance and timeframe for investing. Research different investment options such as stocks, bonds, mutual funds, and real estate. Consider seeking advice from a financial advisor to ensure your investment strategy aligns with your goals.
 
Step 7: Review and Adjust your Plan Regularly
Once you have established your financial plan, it's crucial to review and adjust it periodically. Life circumstances change, goals shift, and market conditions fluctuate. Regularly monitor your plan, making necessary adjustments to stay on track.
 
Conclusion
Creating a comprehensive financial plan enables you to take control of your financial future. By defining your goals, assessing your financial situation, creating a budget, establishing an emergency fund, managing debt, and investing wisely, you can make steady progress toward your objectives. Remember to review and adjust your plan as needed to adapt to changing circumstances. With discipline and commitment, you can achieve the financial freedom and security you desire.
""",
    title: 'Creating a Financial Plan: Steps to Achieve Your Financial Goals',
    image: 'assets/images/lesson_two.jpg',
    isFavorite: false,
    level: 'Beginners',
    quality: 0,
    status: LessonStatus.open,
  ),
  Lesson(
    id: 2,
    description: """
Developing a well-defined financial plan is essential to achieving your short-term and long-term financial objectives. A comprehensive financial plan serves as a roadmap for managing your income, expenses, investments, and savings. Using these tried-and-true steps, this article will guide you through the process of creating a personalized financial plan that aligns with your goals.
 
Step 1: Define Your Financial Goals
The first step in creating a financial plan is to clearly define your financial goals. Are you looking to buy a house, save for retirement, pay off debt, or start a business? By identifying your objectives, you can tailor your plan to prioritize and allocate resources accordingly.
 
Step 2: Assess Your Current Financial Situation
Evaluating your current financial situation is crucial in determining where you stand and what steps you need to take to reach your goals. Take stock of your income, expenses, assets, and liabilities. Analyze your spending habits, debt levels, and savings. This assessment will give you a baseline understanding of your financial health.
 
Step 3: Create a Budget
Developing a budget is the cornerstone of any effective financial plan. A budget helps you track and control your spending, ensuring you allocate resources toward your goals. Calculate your monthly income and categorize your expenses into fixed and variable costs. Identify areas where you can cut back and allocate those savings toward your financial goals.
 
Step 4: Establish an Emergency Fund
An emergency fund is a critical component of any financial plan. Aim to save three to six months' worth of living expenses in a readily accessible account. This fund provides a safety net in case of unexpected emergencies or job loss. Regularly contribute to your emergency fund to maintain its viability.
 
Step 5: Evaluate and Manage Debt
Managing and reducing debt is vital for achieving financial stability. Compile a list of all your outstanding debts, including credit cards, loans, and  mortgages. Create a plan to pay off high-interest debts first while making minimum payments on others. Consider debt consolidation or refinancing options to streamline your debt repayment process.
 
Step 6: Invest for the Future
Investing is an integral part of wealth creation and long-term financial success. Determine your risk tolerance and timeframe for investing. Research different investment options such as stocks, bonds, mutual funds, and real estate. Consider seeking advice from a financial advisor to ensure your investment strategy aligns with your goals.
 
Step 7: Review and Adjust your Plan Regularly
Once you have established your financial plan, it's crucial to review and adjust it periodically. Life circumstances change, goals shift, and market conditions fluctuate. Regularly monitor your plan, making necessary adjustments to stay on track.
 
Conclusion
Creating a comprehensive financial plan enables you to take control of your financial future. By defining your goals, assessing your financial situation, creating a budget, establishing an emergency fund, managing debt, and investing wisely, you can make steady progress toward your objectives. Remember to review and adjust your plan as needed to adapt to changing circumstances. With discipline and commitment, you can achieve the financial freedom and security you desire.
""",
    title: 'Maximizing Profits with Options Trading: Tips and Strategies',
    image: 'assets/images/lesson_three.jpg',
    isFavorite: false,
    level: 'Advanced',
    quality: 30,
    status: LessonStatus.open,
  ),
  Lesson(
    id: 3,
    description: """
When it comes to trading in the financial markets, diversification is a fundamental principle that can significantly impact your success. Diversifying your portfolio minimizes risk and allows for increased opportunities for profitability. In this article, we will explore why diversification is key to successful trading.
 
Spreading Risk
One of the primary advantages of diversification is the ability to spread risk across different assets and markets. By investing in a variety of stocks, bonds, commodities, and currencies, you reduce the impact of a single investment's poor performance on your overall portfolio. When one investment underperforms, others have the potential to outperform, which helps stabilize your returns.
 
Capitalizing on Different Market Conditions
Different assets perform well under different market conditions. For instance, during times of economic growth, stocks tend to thrive, while during economic downturns, bonds may offer safer returns. By diversifying your portfolio, you can benefit from various market conditions and ensure that you have exposure to assets that perform well in different economic environments. This allows you to capture opportunities for profits regardless of the market situation.
 
Mitigating the Impact of Individual Company Risk
Investing in a single company's stock involves a level of risk that is unique to that company, such as poor management decisions or unexpected industry changes. However, by spreading your investments across multiple companies within different sectors, you significantly reduce the impact of any one company's performance on your overall portfolio. This approach helps protect your capital and reduces the likelihood of experiencing substantial losses due to the failure of a single company.
 
Increasing Opportunities for Profitability
Diversification is not only about reducing risk but also about increasing opportunities for profitability. By investing in different assets or markets, you expose yourself to a broader range of potential gains. A well-diversified portfolio allows you to benefit from various investment opportunities that may arise. This maximizes your chances of capturing profitable trades and enhances your overall profitability.
 
Balancing Risk and Return
Diversification helps you strike a balance between risk and return. By including a mix of low-risk and high-risk investments in your portfolio, you can achieve the desired level of risk that aligns with your investing goals. For instance, you may choose to hold a combination of stable blue-chip stocks and more speculative investments. This balanced approach helps you manage risk while still aiming for potentially higher returns.
 
Conclusion
Diversification is a key element in building a successful trading strategy. By spreading risk, capitalizing on different market conditions, mitigating the impact of individual company risk, increasing opportunities for profitability, and balancing risk and return, diversification helps protect your investments and maximize your chances of success. Remember that each individual's investment goals and risk tolerance may vary, so it's essential to tailor your diversification strategy to your specific circumstances. With careful planning and implementation, diversification can play a vital role in your journey towards successful trading.
""",
    title: 'Why Diversification is Key to Successful Trading',
    image: 'assets/images/lesson_four.jpg',
    isFavorite: false,
    level: 'Advanced',
    quality: 30,
    status: LessonStatus.open,
  ),
  Lesson(
    id: 4,
    description: """
Financial planning is a critical aspect of securing a successful and stable future. It involves setting financial goals, creating a roadmap for achieving those goals, and effectively managing your money. In this article, we will explore the importance of financial planning and why it is crucial to invest in your future.
 
Goal Setting and Prioritization
Financial planning starts with setting clear goals and priorities. Whether your goals involve buying a house, saving for retirement, or funding your children's education, having a plan in place allows you to take specific actions towards achieving those goals. It helps you stay focused, motivated, and accountable for your financial decisions.
 
Creating a Budget and Saving
One of the key aspects of financial planning is creating a budget. This involves analyzing your income, expenses, and spending patterns to determine how much you can save and invest. A budget allows you to track your cash flow and identify areas where you can cut back on unnecessary expenses. By saving and investing consistently, you build a solid financial foundation for yourself and your future.
 
Building Wealth and Financial Security
Financial planning enables you to build wealth and achieve financial security. By investing your money wisely, you can increase your net worth over time. This may involve investing in stocks, bonds, real estate, or other investment vehicles that align with your risk tolerance and financial goals. Through smart investing, you can grow your wealth, generate passive income, and secure your financial future.
 
Managing Debt and Minimizing Risk
Financial planning also involves managing debt effectively. By assessing your current debt situation, prioritizing debts with higher interest rates, and creating a repayment plan, you can minimize the impact of debt on your overall financial health. Additionally, proper risk management is crucial in financial planning. This includes having insurance coverage for emergencies, health issues, and potential loss of income. By mitigating risks, you protect your financial well-being and ensure a stable future.
 
Retirement Planning
Planning for retirement is a significant part of financial planning. By estimating your future retirement needs, considering factors such as inflation and healthcare costs, and investing in retirement accounts like a 401(k) or an Individual Retirement Account (IRA), you can secure a comfortable retirement. Starting early and contributing consistently to these accounts allows your retirement savings to grow over time, giving you peace of mind in your golden years.
 
Adapting to Life Changes
Life is constantly evolving, and financial planning provides the flexibility to adapt to unexpected changes. Whether it's a career transition, marriage, having children, or medical emergencies, having a financial plan in place helps you navigate through life's challenges. It allows you to make informed decisions based on your changed circumstances while still working towards your long-term financial goals.
 
Conclusion
Investing in your future through financial planning is essential for achieving long-term financial success and security. By setting goals, creating a budget, saving and investing wisely, managing debt, planning for retirement, and adapting to life changes, you can create a solid foundation for yourself and your family. Remember, financial planning is not a one-time activity but an ongoing process. Regularly reviewing and updating your plan ensures that it remains aligned with your changing goals and circumstances. Start today and make the commitment to invest in your future through effective financial planning.
""",
    title: 'Investing in Your Future: Importance of Financial Planning',
    image: 'assets/images/lesson_five.jpg',
    isFavorite: false,
    level: 'Advanced',
    quality: 30,
    status: LessonStatus.open,
  )
];
