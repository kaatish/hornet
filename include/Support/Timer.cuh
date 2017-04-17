/**
 * @author Federico Busato                                                  <br>
 *         Univerity of Verona, Dept. of Computer Science                   <br>
 *         federico.busato@univr.it
 * @date April, 2017
 * @version v1.3
 *
 * @copyright Copyright © 2017 cuStinger. All rights reserved.
 *
 * @license{<blockquote>
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * * Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 * </blockquote>}
 *
 * @file
 */
#pragma once

#include "Support/Timer.hpp"
#include <cuda_runtime.h>       //cudaEvent_t

namespace timer {

template<typename ChronoPrecision>
class Timer<DEVICE, ChronoPrecision> :
        public TimerBase<DEVICE, ChronoPrecision> {
public:
    using TimerBase<DEVICE, ChronoPrecision>::print;
    using TimerBase<DEVICE, ChronoPrecision>::duration;
    using TimerBase<DEVICE, ChronoPrecision>::total_duration;
    using TimerBase<DEVICE, ChronoPrecision>::average;
    using TimerBase<DEVICE, ChronoPrecision>::std_deviation;

    explicit Timer(int decimals = 1, int space = 15,
                   xlib::Color color = xlib::Color::FG_DEFAULT);
    ~Timer();
    virtual void start() final;
    virtual void stop()  final;
private:
    using TimerBase<DEVICE, ChronoPrecision>::_time_elapsed;
    using TimerBase<DEVICE, ChronoPrecision>::_time_squared;
    using TimerBase<DEVICE, ChronoPrecision>::_total_time_elapsed;
    using TimerBase<DEVICE, ChronoPrecision>::_num_executions;
    using TimerBase<DEVICE, ChronoPrecision>::_start_flag;

    cudaEvent_t _start_event, _stop_event;
};

} // namespace timer

#include "impl/Timer.i.cuh"
