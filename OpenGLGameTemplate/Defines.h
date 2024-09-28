#pragma once

#include <iostream>
#include <assert.h>

#ifdef DEBUG
    #define DEBUG_MSG(str) do { std::cout << str << std::endl; } while (0)
    #define DEBUG_CHECK(arg, msg) assert((arg) && (msg))
    #define ASSERT(arg, msg) assert((arg) && (msg))
#else
    #define DEBUG_MSG(str)
    #define DEBUG_CHECK(arg, msg)
    #define ASSERT(arg, msg) arg
#endif

#define FRAMES_PER_SECOND 60
#define SECONDS_PER_FRAME 1.0 / FRAMES_PER_SECOND

#define INFO_LOG_BUFFER_LENGTH 512
#define UNIFORM_NAME_BUFFER_LENGTH 16