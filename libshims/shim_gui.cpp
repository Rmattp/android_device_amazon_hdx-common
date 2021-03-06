/*
 * Copyright (C) 2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdlib.h>

/* void android::SurfaceControl:setLayer(int32_t) */
extern "C" void _ZN7android14SurfaceControl8setLayerEj(uint32_t);
extern "C" void _ZN7android14SurfaceControl8setLayerEi(int32_t layer) {
    _ZN7android14SurfaceControl8setLayerEj(static_cast<uint32_t>(layer));
}