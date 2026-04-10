import React from 'react'
import { WalletConnect } from './WalletConnect'
import NetworkBadge from './NetworkBadge'
import Image from 'next/image'
import logo from '@/public/logo.png'
import github from '@/public/icon.png'

function Header() {
  return (
    <header className="px-6 py-4 bg-[#1F1E1F] border-[#1F1E1F] mt-[50px] flex items-center justify-between w-[788px] mx-auto rounded-[32px]">
    <div className="flex items-center gap-1">
      <div className="flex items-center gap-3">
      <Image src={logo} alt="logo" width={32} height={32} />
      <span className="text-[#FFFFFF] text-[24.77px] font-medium font-instrument"> SfdStacks</span>
        </div>  
      <NetworkBadge />
    </div>
    <div className='flex space-x-6'>
    <div className='flex space-x-2 items-center justify-center'>
    <Image src={github} alt="logo" />
    <h1 className='text-[16px] text-[#8F8D8E] font-instrument'>Github </h1>
    </div>
    <WalletConnect />
    </div>
  </header>
  )
}

export default Header