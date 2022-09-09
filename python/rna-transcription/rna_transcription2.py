# * `G` -> `C`
# * `C` -> `G`
# * `T` -> `A`
# * `A` -> `U`
from re import fullmatch

def to_rna(string):
    if fullmatch('[GCTA]+', string) == None:
        return ''
    
    DNAtoRNA = string.maketrans('GCTA', 'CGAU')
    return string.translate(DNAtoRNA)