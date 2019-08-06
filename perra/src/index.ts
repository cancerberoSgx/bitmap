import { bitmap as b } from './bitmap'

export const PNGBitmap = b.PNGBitmap
export const BitmapIO = b.BitmapIO
export const BitmapUtil = b.BitmapUtil
export const ColorUtil = b.ColorUtil
export const IOUtil = b.IOUtil
export const Util = b.Util

export const Color = b._Color.Color_Impl_ as typeof b._Color.Color_Impl_

export const bitmap = { ...b, Color }
