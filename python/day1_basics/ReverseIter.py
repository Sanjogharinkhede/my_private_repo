from operator import index


class RevIter:
    def __init__(self,seq):
        self.seq=seq
        self.index=len(seq)
    def __iter__(self):
        return self
    def __next__(self):
        if self.index==0:
            raise StopIteration("some msg")
            # return
        self.index-=1
        return self.seq[self.index]
numbers=[1,2,3,4]
ite=RevIter(numbers)
print(next(ite))
print(next(ite))
print(next(ite))
print(next(ite))
print(next(ite))