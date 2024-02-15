// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import {AaveV3Optimism, AaveV3OptimismAssets} from 'aave-address-book/AaveV3Optimism.sol';
import {MiscOptimism} from 'aave-address-book/MiscOptimism.sol';
import {CLAdapterBaseTest} from '../CLAdapterBaseTest.sol';

contract rETHOptimismPriceCapAdapterTest is CLAdapterBaseTest {
  constructor()
    CLAdapterBaseTest(
      AaveV3OptimismAssets.rETH_ORACLE,
      ForkParams({network: 'optimism', blockNumber: 115941709}),
      RetrospectionParams({
        maxYearlyRatioGrowthPercent: 7_50,
        minimumSnapshotDelay: 7 days,
        startBlock: 113441931,
        finishBlock: 115941709,
        delayInBlocks: 310000, // 7 days
        step: 310000
      }),
      CapParams({maxYearlyRatioGrowthPercent: 2_00, startBlock: 113441931, finishBlock: 115941709}),
      AdapterCreationDefaultParams({
        aclManager: AaveV3Optimism.ACL_MANAGER,
        baseAggregatorAddress: AaveV3OptimismAssets.WETH_ORACLE,
        ratioProviderAddress: MiscOptimism.rETH_ETH_AGGREGATOR,
        pairDescription: 'Capped rETH / ETH / USD'
      })
    )
  {}
}