# Asama 2 listeleri: derleyici assembly'si + kendi fonksiyonlarimizin disassembly'si.
#
# PE imajinda sembol tablosu yok, bu yuzden disassembly araligi /MAP dosyasindan
# bulunur: .text (0001) bolumunde ${OBJ} dosyasina ait ilk sembolden, ondan sonra gelen
# en yakin yabanci (CRT) sembole kadar. Map dosyasi public ve static sembolleri ayri
# bolumlerde listeler; bu yuzden "ilk gorulen" degil, adresce en yakini alinir.
# Adresler 16 haneli kucuk harfli hex oldugu icin metin karsilastirmasi sayisal
# karsilastirmayla aynidir.

file(MAKE_DIRECTORY "${OUT}")
file(COPY_FILE "${ASM}" "${OUT}/asm_${TAG}.s")

file(STRINGS "${MAP}" lines REGEX "^ *0001:[0-9a-f]+ ")
set(lo "")
set(last "")
set(foreign "")
foreach(l IN LISTS lines)
    if(NOT l MATCHES "^ *0001:[0-9a-f]+ +[^ ]+ +([0-9a-f]+) .* ([^ ]+) *$")
        continue()
    endif()
    set(addr "${CMAKE_MATCH_1}")
    if(CMAKE_MATCH_2 STREQUAL "${OBJ}")
        if(lo STREQUAL "" OR addr STRLESS lo)
            set(lo "${addr}")
        endif()
        if(last STREQUAL "" OR addr STRGREATER last)
            set(last "${addr}")
        endif()
    else()
        list(APPEND foreign "${addr}")
    endif()
endforeach()

set(hi "")
foreach(addr IN LISTS foreign)
    if(addr STRGREATER last AND (hi STREQUAL "" OR addr STRLESS hi))
        set(hi "${addr}")
    endif()
endforeach()

if(lo STREQUAL "" OR hi STREQUAL "")
    message(FATAL_ERROR "listings: ${OBJ} araligi ${MAP} icinde bulunamadi")
endif()

execute_process(
    COMMAND "${OBJDUMP}" -d --x86-asm-syntax=intel
            --start-address=0x${lo} --stop-address=0x${hi} "${EXE}"
    OUTPUT_FILE "${OUT}/objdump_${TAG}.txt"
    RESULT_VARIABLE rc)
if(NOT rc EQUAL 0)
    message(FATAL_ERROR "listings: llvm-objdump basarisiz (${rc})")
endif()

message(STATUS "listings: asm_${TAG}.s, objdump_${TAG}.txt  [0x${lo} .. 0x${hi})")
