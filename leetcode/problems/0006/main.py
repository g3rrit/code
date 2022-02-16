class Solution:
    def convert(self, s: str, num_rows: int) -> str:

        mat = [[] for _ in range(num_rows)]
        delta = 1

        i = 0
        for c in s:
            mat[i].append(c)
            i = (i + delta) % num_rows
            delta = -1 * delta if i == 0 or i == num_rows - 1 else delta

        return "".join([c for l in mat for c in l])
