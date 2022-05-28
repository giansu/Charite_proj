%% This script is to pass from the original order of DSIstudio to the order of Brainstorm
% this has to be run for each subject, after having imported the matrices extracted with DSIstudio  

% SEMI - AUTOMATIC procedure

prompt = 'insert subject name: ';
sub_ID = input (prompt, "s");

prompt = 'insert struct row of the struct to be used: ';
n_row = input (prompt);

Struct_conn_r(n_row).subject = sub_ID;

%import DKT
filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_DKT/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.FreeSurferDKT_Cortical.count.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_DKT_n_tracts = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_DKT/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.FreeSurferDKT_Cortical.mean_length.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_DKT_lengths = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_DKT/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.FreeSurferDKT_Cortical.rd.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_DKT_rd = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_DKT/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.FreeSurferDKT_Cortical.fa.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_DKT_fa = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_DKT/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.FreeSurferDKT_Cortical.md.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_DKT_md = imported.connectivity;

% import Glasser
filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_GLA/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.HCP-MMP.count.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_GLA_n_tracts = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_GLA/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.HCP-MMP.mean_length.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_GLA_lengths = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_GLA/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.HCP-MMP.rd.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_GLA_rd = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_GLA/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.HCP-MMP.fa.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_GLA_fa = imported.connectivity;

filename = dir(strcat('F:/Charite/derivatives/str_connectivity_matrices_GLA/',sub_ID,'*.src.gz.dti.fib.gz.tt.gz.HCP-MMP.md.end.connectivity.mat'));
imported=load(strcat(filename.folder,'/',filename.name));
connectivity_GLA_md = imported.connectivity;


% if DKT in DSIstudio
%reordered_from_DSIstudio = connectivity ([1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32], [1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32]);

Struct_conn_r(n_row).DKT_n_tracts = connectivity_DKT_n_tracts ([1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32], [1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32]);
Struct_conn_r(n_row).DKT_lengths = connectivity_DKT_lengths ([1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32], [1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32]);
Struct_conn_r(n_row).DKT_rd = connectivity_DKT_rd ([1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32], [1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32]);
Struct_conn_r(n_row).DKT_fa = connectivity_DKT_fa ([1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32], [1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32]);
Struct_conn_r(n_row).DKT_md = connectivity_DKT_md ([1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32], [1 33 2 34 3 35 4 36 5 37 6 38 7 39 31 62 8 40 9 41 10 42 11 43 12 44 15 47 14 46 16 48 17 49 18 50 19 51 20 52 21 53 22 54 23 55 24 56 25 57 27 59 29 60 30 61 26 58 13 45 28 32]);


% if Glasser in DSIstudio (HCP_MMP1)
%reordered_from_DSIstudio = connectivity ([51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213] , [51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213]);

Struct_conn_r(n_row).GLA_n_tracts = connectivity_GLA_n_tracts ([51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213] , [51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213]);
Struct_conn_r(n_row).GLA_lengths = connectivity_GLA_lengths ([51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213] , [51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213]);
Struct_conn_r(n_row).GLA_rd = connectivity_GLA_rd ([51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213] , [51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213]);
Struct_conn_r(n_row).GLA_fa = connectivity_GLA_fa ([51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213] , [51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213]);
Struct_conn_r(n_row).GLA_md = connectivity_GLA_md ([51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213] , [51 231 72 252 90 270 65 245 88 268 91 271 92 272 52 232 38 218 32 212 40 220 41 221 164 344 162 342 161 341 35 215 58 238 53 233 9 189 8 188 99 279 74 254 75 255 84 264 76 256 66 246 94 274 103 283 12 192 39 219 36 216 37 217 96 276 54 234 44 224 55 235 78 258 56 236 42 222 45 225 47 227 46 226 29 209 30 210 68 248 67 247 70 250 63 243 73 253 86 266 87 267 69 249 71 251 24 204 175 355 125 305 112 292 117 297 111 291 142 322 118 298 10 190 18 198 113 293 115 295 114 294 108 288 169 349 157 337 120 300 79 259 80 260 82 262 81 261 146 326 145 325 144 324 17 197 168 348 174 354 95 275 48 228 20 200 21 201 159 339 173 353 109 289 50 230 2 182 23 203 93 273 101 281 102 282 100 280 124 304 27 207 11 191 148 328 105 285 149 329 147 327 116 296 150 330 143 323 151 331 138 318 126 306 155 335 127 307 137 317 178 358 22 202 31 211 15 195 25 205 122 302 110 290 167 347 106 286 119 299 121 301 104 284 14 194 43 223 26 206 123 303 128 308 129 309 176 356 130 310 28 208 107 287 132 312 177 357 133 313 134 314 136 316 135 315 131 311 172 352 139 319 140 320 141 321 1 181 4 184 5 185 13 193 19 199 158 338 6 186 156 336 3 183 152 332 16 196 7 187 49 229 153 333 160 340 154 334 163 343 89 269 61 241 59 239 179 359 77 257 85 265 34 214 62 242 97 277 170 350 180 360 57 237 64 244 60 240 171 351 83 263 166 346 165 345 98 278 33 213]);

