import 'package:quotex/terms/domain/model/terms_model.dart';

const String appName = 'Quoteq';
const apiDomain = 'tugasad.space';
const apiToken = 'fa7ed76d-2d95-4d5d-936b-9870fcdd6533';
const zaglushka = 'tugasad.space/app/qu0t4ks';
final List<TermsModel> trading = [
  TermsModel()
    ..id = 0
    ..category = 'trading'
    ..isFavorite = false
    ..name = 'Broker'
    ..rightDescription =
        'This is the entity that lets you buy and sell investments for you. Usually, you pay a fee for this service. There are also plenty of online discount brokers, where you often pay a flat commission per trade'
    ..wrongDescriptionOne = 'Monew Market'
    ..wrongDescriptionTwo = 'Traditional IRA'
    ..wrongDescriptionThree = 'Bull Market',
  TermsModel(
    id: 1,
    category: 'trading',
    isFavorite: false,
    name: 'Brokerage Account',
    rightDescription:
        'A brokerage account is created by a licensed brokerage firm, that allows an investor to add funds and then the investor can place investment orders. The investor owns the assets contained in the brokerage account but will usually have to claim any taxable income from capital gains',
    wrongDescriptionOne: 'Broker',
    wrongDescriptionTwo: 'Real Estate',
    wrongDescriptionThree: 'Bear Market',
  ),
  TermsModel(
    id: 2,
    category: 'trading',
    isFavorite: false,
    name: 'Money Market',
    rightDescription:
        'A money market account is an interest-bearing account that will typically pay a higher interest rate than a bank savings account would. I actually store a significant portion of my savings in this for a much better monthly return, than the 0.001% interest of my bank',
    wrongDescriptionOne: 'Broker',
    wrongDescriptionTwo: 'Brokerage Account',
    wrongDescriptionThree: 'Bear Market',
  ),
  TermsModel(
    id: 3,
    category: 'trading',
    isFavorite: false,
    name: 'Traditional IRA',
    rightDescription:
        'A traditional IRA is an individual retirement account that offers tax advantages to savers. You won’t pay taxes upfront, but you will when you withdraw during retirement. Traditional IRAs offer tax deductions of up to \$5,500 a year (\$6,500 for those 50 and older)',
    wrongDescriptionOne: 'Money Market',
    wrongDescriptionTwo: 'Brokerage Account',
    wrongDescriptionThree: 'Roth IRA',
  ),
  TermsModel(
      id: 4,
      category: 'trading',
      isFavorite: false,
      name: 'Roth IRA',
      rightDescription:
          'An individual retirement account allowing a person to set aside after-tax income. Similar to the Traditional IRA. you can contribute the maximum of \$5,500 to a Roth IRA (\$6,500 if you are age 50 or older by the end of the year). The difference is you are not taxed when you take your retirement payments. However, there are limitations pending your salary',
      wrongDescriptionOne: 'Traditional IRA',
      wrongDescriptionTwo: 'Brokerage Account',
      wrongDescriptionThree: 'Stocks'),
  TermsModel(
      id: 6,
      category: 'trading',
      isFavorite: false,
      name: 'SEP-IRA',
      rightDescription:
          'This form of IRA can be used by self-employed people and small business owners under certain circumstances. The contribution limits are much higher than a Traditional IRA or Roth IRA',
      wrongDescriptionOne: 'Stocks',
      wrongDescriptionTwo: 'Simple IRA',
      wrongDescriptionThree: 'Bear Market'),
  TermsModel(
      id: 7,
      category: 'trading',
      isFavorite: false,
      name: 'Simple IRA',
      rightDescription:
          'A type of IRA for small business owners with fewer than 100 employees who want to offer some sort of retirement benefits to their employees but don’t want to deal with larger challenges that come with a 401k company',
      wrongDescriptionOne: 'Index Fund',
      wrongDescriptionTwo: 'Bond',
      wrongDescriptionThree: 'Real Estate'),
  TermsModel(
      id: 8,
      category: 'trading',
      isFavorite: false,
      name: 'Bond',
      rightDescription:
          'A bond is a fixed income investment in which an investor loans money typically corporate or governmental which borrows the funds for a defined period of time at a variable or fixed interest rate. There are many types of bonds out there',
      wrongDescriptionOne: 'Simple IRA',
      wrongDescriptionTwo: 'Broker',
      wrongDescriptionThree: 'Stocks'),
  TermsModel(
      id: 9,
      category: 'trading',
      isFavorite: false,
      name: 'Stocks',
      rightDescription:
          'A stock (also known as “shares” and “equity) is a type of security that signifies ownership in a corporation and represents a claim on part of the corporation’s assets and earnings. There are two main types of stock: common and preferred. Feel free to Google those if interested',
      wrongDescriptionOne: 'Bond',
      wrongDescriptionTwo: 'Brokerage Account',
      wrongDescriptionThree: 'Real Estate'),
  TermsModel(
      id: 10,
      category: 'trading',
      isFavorite: false,
      name: 'Real Estate',
      rightDescription:
          'Real estate is property, such as land, houses, buildings, or garages that the owner can use or allow others to use in exchange for payment in rent. These properties can also be flipped for profit as well',
      wrongDescriptionOne: 'ETF',
      wrongDescriptionTwo: 'Stocks',
      wrongDescriptionThree: 'Index Fund'),
  TermsModel(
      id: 11,
      category: 'trading',
      isFavorite: false,
      name: 'ETF',
      rightDescription:
          'Or exchange-traded funds are like mutual funds, except that they trade throughout the day on stock exchanges as if they were individual stocks. These ETFs can hold various assets like stocks, commodities, or bonds',
      wrongDescriptionOne: 'Real Estate',
      wrongDescriptionTwo: 'Bull Market',
      wrongDescriptionThree: 'Bear Market'),
  TermsModel(
      id: 12,
      category: 'trading',
      isFavorite: false,
      name: 'Index Fund',
      rightDescription:
          'An index fund is a mutual fund, that allows an individual to “invest” in an index, such as the S&P 500. Index funds are very similar to how mutual funds work, but typically have very low fees and are the better choice',
      wrongDescriptionOne: 'Real Estate',
      wrongDescriptionTwo: 'ETF',
      wrongDescriptionThree: 'Bull Market'),
  TermsModel(
      id: 13,
      category: 'trading',
      isFavorite: false,
      name: 'Bull Market',
      rightDescription:
          'A bull market when the market is moving in a positive direction and is expected to continue. Basically, optimism is high and investor confidence expects that strong results should continue, either for months or years',
      wrongDescriptionOne: 'Broker',
      wrongDescriptionTwo: 'Brokerage Account',
      wrongDescriptionThree: 'Bear Market'),
  TermsModel(
    id: 14,
    category: 'trading',
    isFavorite: false,
    name: 'Bear Market',
    rightDescription:
        'A bear market is a period where stock prices are falling. In a bear market, investor confidence is extremely low, and many investors start to sell off their stocks during a bear market for fear of further losses, thus fueling the negative market more',
    wrongDescriptionOne: 'ETF',
    wrongDescriptionTwo: 'Bond',
    wrongDescriptionThree: 'Bull Market',
  )
];

final stocksInitial = [
  TermsModel(
    category: 'stocks',
    id: 100,
    isFavorite: false,
    name: 'Arbitrage',
    rightDescription:
        '... refers to purchasing an asset from one market and selling it to another market where the selling price is higher than what you paid for it, resulting in profit. ',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Asset Allocation',
    wrongDescriptionTwo: 'Asset Classes',
  ),
  TermsModel(
    category: 'stocks',
    id: 101,
    isFavorite: false,
    name: 'Ask',
    rightDescription:
        '... is the selling price that a trader offers for their shares.',
    wrongDescriptionOne: 'Bear Market',
    wrongDescriptionThree: 'Asset Allocation',
    wrongDescriptionTwo: 'Arbitrage',
  ),
  TermsModel(
    category: 'stocks',
    id: 102,
    isFavorite: false,
    name: 'Asset Allocation',
    rightDescription:
        '... is an investment strategy that aims to balance risk and reward by dividing a certain percentage of investments—like stocks, bonds, real estate, cash, etc.—across different assets in an investment portfolio',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Bear Market',
    wrongDescriptionTwo: 'Asset Classes',
  ),
  TermsModel(
    category: 'stocks',
    id: 103,
    isFavorite: false,
    name: 'Asset Classes',
    rightDescription:
        '... are categories of assets, such as stocks, bonds, real estate, or cash',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Asset Allocation',
    wrongDescriptionTwo: 'Arbitrage',
  ),
  TermsModel(
    category: 'stocks',
    id: 104,
    isFavorite: false,
    name: 'Beta',
    rightDescription:
        '...  is the measure of an asset’s risk in relation to the market. A stock with a beta of 1.5 means that the stock typically moves 50% more than the market in the same direction.',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Asset Allocation',
    wrongDescriptionTwo: 'Asset Classes',
  ),
  TermsModel(
    category: 'stocks',
    id: 105,
    isFavorite: false,
    name: 'Bid',
    rightDescription:
        '... The price a trader is willing to pay for shares of a stock or other asset. ',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Beta',
    wrongDescriptionTwo: 'Asset Classes',
  ),
  TermsModel(
    category: 'stocks',
    id: 106,
    isFavorite: false,
    name: 'Blockchain',
    rightDescription:
        '... is a record-keeping database in which transactions made in Bitcoin or other cryptocurrencies are recorded across multiple computers and distributed across the entire network of those computers',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
  TermsModel(
    category: 'stocks',
    id: 107,
    isFavorite: false,
    name: 'Stock Portfolio',
    rightDescription:
        '... is an individual’s collection of investments, including stocks, bonds, mutual funds, and other financial assets. While a portfolio refers to all of your investments, they might not be contained in one single account',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
  TermsModel(
    category: 'stocks',
    id: 108,
    isFavorite: false,
    name: 'Nasdaq',
    rightDescription:
        '... is an electronic exchange where investors can buy and sell stocks through an automated network of computers. It’s the second-largest stock exchange in the world, following the NYSE',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
  TermsModel(
    category: 'stocks',
    id: 109,
    isFavorite: false,
    name: 'Order Imbalance',
    rightDescription:
        '... occurs when orders of one type of stock aren’t offset by opposite orders, resulting in an excess of orders for that specific stock and sometimes volatile price changes',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
  TermsModel(
    category: 'stocks',
    id: 110,
    isFavorite: false,
    name: 'Outstanding Shares',
    rightDescription:
        '... refers to the total number of a company’s shares that have been issued to shareholders, including restricted shares',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
];

final readingChartsInitial = [
  TermsModel(
    category: 'readingCharts',
    id: 200,
    isFavorite: false,
    name: 'Going Long',
    rightDescription:
        '... refers to the act of buying stock shares with the expectation that the asset’s price will rise, resulting in a profit',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 201,
    isFavorite: false,
    name: 'Going Short',
    rightDescription:
        '... the opposite of going long—refers to the act of selling stock shares with the expectation that the asset’s price will fall.',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Going Long',
    wrongDescriptionTwo: 'Stocks',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 202,
    isFavorite: false,
    name: 'Volume',
    rightDescription:
        '... is a measure of how much a certain stock or other investment has been traded over a certain period of time.',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Yield',
    wrongDescriptionTwo: 'Time Horizon',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 203,
    isFavorite: false,
    name: 'Time Horizon',
    rightDescription:
        '... refers to the period of time an investor expects to hold an investment, which will vary based on personal investment goals and strategies',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'Volume',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 204,
    isFavorite: false,
    name: '52-week Range',
    rightDescription:
        '... is a technical indicator that measures the lowest and highest price of a stock traded during a 52-week period. Traders use this measure to analyze current stock prices and predict its future movements.',
    wrongDescriptionOne: 'Stock Split',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'Yield',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 205,
    isFavorite: false,
    name: 'Outstanding Shares',
    rightDescription:
        '... refers to the total number of a company’s shares that have been issued to shareholders, including restricted shares',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 206,
    isFavorite: false,
    name: 'P/E Ratio',
    rightDescription:
        'Used to value a company, the ..., or price-earnings ratio, is the ratio of a company’s share price to the company’s earnings per share',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Going Long',
    wrongDescriptionTwo: 'Stocks',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 207,
    isFavorite: false,
    name: 'Volume',
    rightDescription:
        '... is a measure of how much a certain stock or other investment has been traded over a certain period of time.',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Yield',
    wrongDescriptionTwo: 'Time Horizon',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 208,
    isFavorite: false,
    name: 'Preferred Stock',
    rightDescription:
        '... is a type of stock that combines characteristics of both common stock and bonds.',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'Volume',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 209,
    isFavorite: false,
    name: 'Sector',
    rightDescription:
        'The stock market includes shares from thousands of different companies, which are broken into 11 different sectors. ... is a group of companies with similar business products, services, or characteristics.',
    wrongDescriptionOne: 'Stock Split',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'Yield',
  ),
  TermsModel(
    category: 'readingCharts',
    id: 210,
    isFavorite: false,
    name: 'Stock Option',
    rightDescription:
        '... is a contract that gives an investor the right to purchase or sell a specific number of stock shares at a predetermined price within a specified time period',
    wrongDescriptionOne: 'Stock Split',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'Yield',
  ),
];

final base = [
  TermsModel()
    ..id = 0
    ..category = 'base'
    ..isFavorite = false
    ..name = 'Broker'
    ..rightDescription =
        'This is the entity that lets you buy and sell investments for you. Usually, you pay a fee for this service. There are also plenty of online discount brokers, where you often pay a flat commission per trade'
    ..wrongDescriptionOne = 'Monew Market'
    ..wrongDescriptionTwo = 'Traditional IRA'
    ..wrongDescriptionThree = 'Bull Market',
  TermsModel(
    id: 1,
    category: 'base',
    isFavorite: false,
    name: 'Brokerage Account',
    rightDescription:
        'A brokerage account is created by a licensed brokerage firm, that allows an investor to add funds and then the investor can place investment orders. The investor owns the assets contained in the brokerage account but will usually have to claim any taxable income from capital gains',
    wrongDescriptionOne: 'Broker',
    wrongDescriptionTwo: 'Real Estate',
    wrongDescriptionThree: 'Bear Market',
  ),
  TermsModel(
    id: 2,
    category: 'base',
    isFavorite: false,
    name: 'Money Market',
    rightDescription:
        'A money market account is an interest-bearing account that will typically pay a higher interest rate than a bank savings account would. I actually store a significant portion of my savings in this for a much better monthly return, than the 0.001% interest of my bank',
    wrongDescriptionOne: 'Broker',
    wrongDescriptionTwo: 'Brokerage Account',
    wrongDescriptionThree: 'Bear Market',
  ),
  TermsModel(
    id: 3,
    category: 'base',
    isFavorite: false,
    name: 'Traditional IRA',
    rightDescription:
        'A traditional IRA is an individual retirement account that offers tax advantages to savers. You won’t pay taxes upfront, but you will when you withdraw during retirement. Traditional IRAs offer tax deductions of up to \$5,500 a year (\$6,500 for those 50 and older)',
    wrongDescriptionOne: 'Money Market',
    wrongDescriptionTwo: 'Brokerage Account',
    wrongDescriptionThree: 'Roth IRA',
  ),
  TermsModel(
    category: 'base',
    id: 100,
    isFavorite: false,
    name: 'Arbitrage',
    rightDescription:
        '... refers to purchasing an asset from one market and selling it to another market where the selling price is higher than what you paid for it, resulting in profit. ',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Asset Allocation',
    wrongDescriptionTwo: 'Asset Classes',
  ),
  TermsModel(
    category: 'base',
    id: 101,
    isFavorite: false,
    name: 'Ask',
    rightDescription:
        '... is the selling price that a trader offers for their shares.',
    wrongDescriptionOne: 'Bear Market',
    wrongDescriptionThree: 'Asset Allocation',
    wrongDescriptionTwo: 'Arbitrage',
  ),
  TermsModel(
    category: 'base',
    id: 102,
    isFavorite: false,
    name: 'Asset Allocation',
    rightDescription:
        '... is an investment strategy that aims to balance risk and reward by dividing a certain percentage of investments—like stocks, bonds, real estate, cash, etc.—across different assets in an investment portfolio',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Bear Market',
    wrongDescriptionTwo: 'Asset Classes',
  ),
  TermsModel(
    category: 'base',
    id: 103,
    isFavorite: false,
    name: 'Asset Classes',
    rightDescription:
        '... are categories of assets, such as stocks, bonds, real estate, or cash',
    wrongDescriptionOne: 'Ask',
    wrongDescriptionThree: 'Asset Allocation',
    wrongDescriptionTwo: 'Arbitrage',
  ),
  TermsModel(
    category: 'base',
    id: 200,
    isFavorite: false,
    name: 'Going Long',
    rightDescription:
        '... refers to the act of buying stock shares with the expectation that the asset’s price will rise, resulting in a profit',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
  TermsModel(
    category: 'base',
    id: 201,
    isFavorite: false,
    name: 'Going Short',
    rightDescription:
        '... the opposite of going long—refers to the act of selling stock shares with the expectation that the asset’s price will fall.',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Going Long',
    wrongDescriptionTwo: 'Stocks',
  ),
  TermsModel(
    category: 'base',
    id: 202,
    isFavorite: false,
    name: 'Volume',
    rightDescription:
        '... is a measure of how much a certain stock or other investment has been traded over a certain period of time.',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Yield',
    wrongDescriptionTwo: 'Time Horizon',
  ),
  TermsModel(
    category: 'base',
    id: 203,
    isFavorite: false,
    name: 'Time Horizon',
    rightDescription:
        '... refers to the period of time an investor expects to hold an investment, which will vary based on personal investment goals and strategies',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'Volume',
  ),
  TermsModel(
    category: 'base',
    id: 204,
    isFavorite: false,
    name: '52-week Range',
    rightDescription:
        '... is a technical indicator that measures the lowest and highest price of a stock traded during a 52-week period. Traders use this measure to analyze current stock prices and predict its future movements.',
    wrongDescriptionOne: 'Stock Split',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'Yield',
  ),
  TermsModel(
    category: 'base',
    id: 205,
    isFavorite: false,
    name: 'Outstanding Shares',
    rightDescription:
        '... refers to the total number of a company’s shares that have been issued to shareholders, including restricted shares',
    wrongDescriptionOne: 'Blue-Chip Stocks',
    wrongDescriptionThree: 'Broker',
    wrongDescriptionTwo: 'ETF',
  ),
];
