import { describe, expect, it } from 'vitest';
import { initSimnet } from '@stacks/clarinet-sdk';
import { Cl } from '@stacks/transactions';

const simnet = await initSimnet();
const accounts = simnet.getAccounts();
const deployer = accounts.get('deployer')!;

describe('nft NFT', () => {
  it('mints a token', () => {
    const { result } = simnet.callPublicFn('nft', 'mint', [Cl.principal(deployer)], deployer);
    expect(result).toBeOk(Cl.uint(1));
  });
});
