#if !defined(DEFINES_H)

typedef signed char b8;
typedef short b16;
typedef int b32;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

typedef signed char i8;
typedef short i16;
typedef int i32;
typedef long long i64;
typedef i8 int8;
typedef i16 int16;
typedef i32 int32;
typedef i64 int64;

typedef float f32;
typedef double f64;

#define ARRAY_SIZE(Arr) sizeof(Arr) / sizeof(Arr[0])
#define ASSERT(Expression)                                                                                        \
    if (!(Expression))                                                                                            \
    {                                                                                                             \
        *((int volatile *)nullptr) = 0;                                                                                 \
    }
#define VK_CHECK(Call)                                                                                            \
    {                                                                                                             \
        SU_ASSERT(Call == VK_SUCCESS);                                                                            \
    }
#define MEMZERO(MemPtr, Size)                                                                                     \
    {                                                                                                             \
        u8 *Ptr = (u8 *)MemPtr;                                                                                   \
        for (i32 i = 0; i < Size; ++i)                                                                            \
        {                                                                                                         \
            *Ptr++ = 0;                                                                                           \
        }                                                                                                         \
    }
#define WIN32_LOG_OUTPUT(FormatString, ...)                                                                       \
    {                                                                                                             \
        char TextBuffer[256];                                                                                     \
        _snprintf_s(TextBuffer, 256, FormatString, __VA_ARGS__);                                                  \
        OutputDebugStringA(TextBuffer);                                                                           \
    }

#define SU_EXPORT __declspec(dllimport)

const char *EngineName = "Shura Engine";
#define DEFINES_H
#endif // DEFINES_H