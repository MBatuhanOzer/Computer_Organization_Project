cmake_minimum_required(VERSION 3.21)
project(cmpe3209_rle C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Statik CRT: tek dosyalik exe, DLL bagimliligi yok. Derleme ve calistirma ayni
# makinede tekrarlanabilir olsun diye acikca ayarlanir (clang-cl varsayilani da budur).
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")

add_executable(rle main.c)

# Raporun butun adresleri bu uc linker ayarina baglidir:
#
#   /DYNAMICBASE:NO   ASLR kapali. Bu olmadan PE imaji her calistirmada farkli bir
#                     tabana yuklenir ve /MAP dosyasindaki adresler ile debugger'da
#                     gorulen adresler tutmaz. gcc'deki -no-pie karsiligi.
#
#   /INCREMENTAL:NO   Artimli linkleme kapali. Acik oldugunda linker her fonksiyon
#                     icin bir ILT thunk'i (jmp) uretir ve "call rle_encode" once
#                     thunk'a, oradan fonksiyona gider. Asama 3'teki instruction
#                     cycle izleme tablosuna kaynakta olmayan sahte bir jmp girerdi.
#
#   /MAP              Sembol adresleri. PE imajinda sembol tablosu bulunmadigi icin
#                     llvm-objdump fonksiyon adlarini tek basina gosteremez; kernel'i
#                     ve dizileri bulmak bu dosyadan yapilir.
#
# /DEBUG, /Zi ile birlikte PDB uretir (Visual Studio'da kaynak seviyesinde stepping).
target_link_options(rle PRIVATE /DYNAMICBASE:NO /INCREMENTAL:NO /MAP /DEBUG)

# Asama 2 listeleri. Derleyicinin kendi assembly ciktisi her instruction grubunu
# "# main.c:NN" ile isaretler; 2a'daki C satiri -> assembly eslemesi buradan okunur.
# /FA yalnizca yan cikti uretir, object kodu degistirmez.
target_compile_options(rle PRIVATE /FA "/Fa${CMAKE_BINARY_DIR}/rle.s")

# Her derlemeden sonra listings/ altina iki dosya yazilir:
#   asm_<TAG>.s       derleyici assembly'si (C satir isaretli)
#   objdump_<TAG>.txt linklenmis exe'deki kendi fonksiyonlarimizin disassembly'si
#                     (adres + makine kodu byte'lari; 2c dogrulamasi bununla yapilir)
find_program(LLVM_OBJDUMP llvm-objdump REQUIRED)
set(LISTING_TAG "${CMAKE_BUILD_TYPE}" CACHE STRING "listings/ dosyalarinin soneki (O0 / O1)")
add_custom_command(TARGET rle POST_BUILD
    COMMAND ${CMAKE_COMMAND}
            -DMAP=$<TARGET_FILE_DIR:rle>/rle.map
            -DEXE=$<TARGET_FILE:rle>
            -DASM=${CMAKE_BINARY_DIR}/rle.s
            -DOBJDUMP=${LLVM_OBJDUMP}
            -DOUT=${CMAKE_SOURCE_DIR}/listings
            -DTAG=${LISTING_TAG}
            -P ${CMAKE_SOURCE_DIR}/cmake/listings.cmake
    VERBATIM)
