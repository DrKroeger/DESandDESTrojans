// Contains the messages that are used in the DES Implementation
reg [63:0] mess;
always@(*) begin
case(sw)
0: mess   <= 64'hFFFFFFFFFFFFFFFF;
1: mess   <= 64'h01b7d70aa29751fb;
2: mess   <= 64'hc038c315db08d56b;
3: mess   <= 64'h5b3347c3810b2549;
4: mess   <= 64'h96d9f10f6c3755b9;
5: mess   <= 64'hc703588750c916e2;
6: mess   <= 64'h318879ab957b5a50;
7: mess   <= 64'h99121f33a1aca88c;
8: mess   <= 64'hf3c751d628b39429;
9: mess   <= 64'h4764eec035917692;
10: mess  <= 64'h43e04e6540c4151c;
11: mess  <= 64'h572ef49232280fa9;
12: mess  <= 64'h962d59368b53d09e;
13: mess  <= 64'hb603b0e8c59f1d34;
14: mess  <= 64'haa7febfffde54cae;
15: mess  <= 64'h04c4d33938b11df1;
16: mess  <= 64'ha1ebbb020c6bb5ea;
17: mess  <= 64'h083dd1f167f848ec;
18: mess  <= 64'h1d95ad7bf060fb85;
19: mess  <= 64'h15c143ddc9d497db;
20: mess  <= 64'h8b53234b5f7e1b93;
21: mess  <= 64'hda54f257347cc185;
22: mess  <= 64'hfb503968bdb50043;
23: mess  <= 64'h6bb6e144feda0444;
24: mess  <= 64'h80a5ebf522785c81;
25: mess  <= 64'ha933af284be1d61f;
26: mess  <= 64'h64fddff8d6685aee;
27: mess  <= 64'h46a8563370d693f4;
28: mess  <= 64'hc280e34088866aac;
29: mess  <= 64'h06f6bf0c28828996;
30: mess  <= 64'ha92360b9d5e4c619;
31: mess  <= 64'h54510233427a7228;
32: mess  <= 64'h243eb399b887a275;
33: mess  <= 64'h882f96c65118fa4a;
34: mess  <= 64'hf2033ef0a78931e9;
35: mess  <= 64'h0db47332049350db;
36: mess  <= 64'h78de6fb71086c0b0;
37: mess  <= 64'h19ab202bda1ee11b;
38: mess  <= 64'h48ce177cf5c477dc;
39: mess  <= 64'hbf51788bf7230b66;
40: mess  <= 64'h3fee0affc8fd2b23;
41: mess  <= 64'h9959e5d39d16a5a0;
42: mess  <= 64'h04c9d7d831df7acf;
43: mess  <= 64'he11826ee5cfb0bdd;
44: mess  <= 64'hb64113c83b0b3b43;
45: mess  <= 64'h1bf68a23dfcc9fd4;
46: mess  <= 64'h02488b22c1eb6661;
47: mess  <= 64'h7f3890b202822e20;
48: mess  <= 64'ha59d9d8887385334;
49: mess  <= 64'hdb3e6b12450940aa;
50: mess  <= 64'hb3f85b5996fe085b;
51: mess  <= 64'hacb7a518a9dbbd1b;
52: mess  <= 64'h19e8b0259f943fdd;
53: mess  <= 64'he1a0f33717f51b23;
54: mess  <= 64'h751ce318f8650551;
55: mess  <= 64'h665183efac91d6ba;
56: mess  <= 64'h50ba72133f41340c;
57: mess  <= 64'h375f767d691804bc;
58: mess  <= 64'h0f5af97299c5661c;
59: mess  <= 64'h40c400b25c7f0f46;
60: mess  <= 64'hc076256ce498ac18;
61: mess  <= 64'h7ac2c1b7465fb0df;
62: mess  <= 64'h0576ff2d82f2e474;
63: mess  <= 64'h81ab46cd6bbc6b8b;
64: mess  <= 64'hbe09ebbf2184ebcc;
65: mess  <= 64'he5ae24ef3e8dbd51;
66: mess  <= 64'hf2013e4b3f518e78;
67: mess  <= 64'hbb7dd3b66c0a98ef;
68: mess  <= 64'h84069c1f2991d329;
69: mess  <= 64'hb29a85b5396fd178;
70: mess  <= 64'h3fb86367d8f27654;
71: mess  <= 64'h674a29d975e9613a;
72: mess  <= 64'h94ed1f89eb08e1da;
73: mess  <= 64'hc42c4f174bc10fb2;
74: mess  <= 64'h3333364041db052b;
75: mess  <= 64'hb58a66ef55837ddf;
76: mess  <= 64'hcbd105fde79f2503;
77: mess  <= 64'hcfadc1ff83f1384e;
78: mess  <= 64'h7f64a9886d4b2e72;
79: mess  <= 64'ha27b4e4ee666ef64;
80: mess  <= 64'hd72526b8014d4ead;
81: mess  <= 64'h8df51653f90cda63;
82: mess  <= 64'he0c28761036c543c;
83: mess  <= 64'hb620da37a1e15a96;
84: mess  <= 64'h20d8c6483fe664d4;
85: mess  <= 64'h41bdc38fd1035f60;
86: mess  <= 64'h51978365009b77f8;
87: mess  <= 64'h89e746225c020073;
88: mess  <= 64'hbeeca15074b7f570;
89: mess  <= 64'h11c4a2e77ad8dba2;
90: mess  <= 64'h9df05fa67691d5d8;
91: mess  <= 64'h601c7b7824635e1b;
92: mess  <= 64'h676d04f5e64d093c;
93: mess  <= 64'h03ef6644a1db0d26;
94: mess  <= 64'h4083cc81da5a7cf0;
95: mess  <= 64'he75e0e4daaedbfc8;
96: mess  <= 64'heffbed14d22d8ea8;
97: mess  <= 64'h7550c73595bae6fe;
98: mess  <= 64'h027b76c62a81781d;
99: mess  <= 64'h82ba40a0bd3e026c;
100: mess <= 64'h92eae0986a424ea0;
101: mess <= 64'h548cd137eaaa273a;
102: mess <= 64'h80475110b2688fd2;
103: mess <= 64'h4463376b0deedc07;
104: mess <= 64'hf26713a37faa9395;
105: mess <= 64'h5b69a23681c545c5;
106: mess <= 64'h3395a236f0e1194a;
107: mess <= 64'hcab20da9fe6811b9;
108: mess <= 64'h0dbbd6344fd77fd7;
109: mess <= 64'h029f5ee3c4925138;
110: mess <= 64'h94c12eb96ec2bff4;
111: mess <= 64'h099f837db17b7320;
112: mess <= 64'he9034d9b3664ee98;
113: mess <= 64'h9bfba945140e4ee9;
114: mess <= 64'ha66cbb8e0c5c9d61;
115: mess <= 64'h34c51e9ec86743a6;
116: mess <= 64'h26d55be679d72638;
117: mess <= 64'h6093b789aead85d0;
118: mess <= 64'hc1506355649010ec;
119: mess <= 64'h66f7f3133e3188df;
120: mess <= 64'h79e134979d67351f;
121: mess <= 64'h8a315e1fb1d310b0;
122: mess <= 64'h02ffe1f525d09ed4;
123: mess <= 64'h169665b231a34c6e;
124: mess <= 64'h9a57142bda48c68c;
125: mess <= 64'hf606e49e8c44b48c;
126: mess <= 64'h73d41eea41954857;
127: mess <= 64'hc5aa29caa9564883;
128: mess <= 64'h3691c59e168f106c;
129: mess <= 64'h4f726b5d70b52917;
130: mess <= 64'he93a507ba96dcdbd;
131: mess <= 64'h5039758645a6efe0;
132: mess <= 64'h5bac5258add27c05;
133: mess <= 64'h0fcf449a475e7f87;
134: mess <= 64'h370b2f04ddb43bd7;
135: mess <= 64'h0b5d3213b5ab92e1;
136: mess <= 64'h9b151930082a41e5;
137: mess <= 64'h39504937e1fb3dde;
138: mess <= 64'h812f9dc9066095a6;
139: mess <= 64'h6019d1829277f0ab;
140: mess <= 64'hfe8867085687e6f9;
141: mess <= 64'h7a95ce96c1661b28;
142: mess <= 64'h6530958d6540900b;
143: mess <= 64'h444065a05e801010;
144: mess <= 64'haafe81b7f255d57e;
145: mess <= 64'ha9b142d3fca27566;
146: mess <= 64'hfca954b5c1c627ec;
147: mess <= 64'h9777b9f3ba93100d;
148: mess <= 64'hf3fa187ac37c34c9;
149: mess <= 64'hd90d1a232169bf05;
150: mess <= 64'hd23411461c8318a8;
151: mess <= 64'h45518d2949a8e536;
152: mess <= 64'h993a14ae7f41dc90;
153: mess <= 64'h6ec37b64951f5e5d;
154: mess <= 64'h409c79e649d9ccf7;
155: mess <= 64'h79f013b0198c4d9e;
156: mess <= 64'h6532f396a3177221;
157: mess <= 64'h04ed055ed80f00f9;
158: mess <= 64'h57ce92feea101c0a;
159: mess <= 64'ha25d518bc764d91f;
160: mess <= 64'h42db3467905382c6;
161: mess <= 64'hfd9800e0288e80f7;
162: mess <= 64'h02c2e5da0560b107;
163: mess <= 64'h7a228ed3f36bded0;
164: mess <= 64'h2f546c8099029596;
165: mess <= 64'h7d6f7c888b9d43c5;
166: mess <= 64'h2d6eb5272747cf48;
167: mess <= 64'hd3d59a10734a5367;
168: mess <= 64'hc6fd5ebcfe55d53d;
169: mess <= 64'hcb1b2dc0618e2dba;
170: mess <= 64'h0f42e3aa52b6aa4f;
171: mess <= 64'h918c740368c662d8;
172: mess <= 64'hfab21970ac4c171f;
173: mess <= 64'hbb1f562b54198e80;
174: mess <= 64'h222116f59eb69aef;
175: mess <= 64'h4068cf36449a1ece;
176: mess <= 64'he142750fa83b8fad;
177: mess <= 64'ha1fcf3ccea64e7a8;
178: mess <= 64'h8b2605423823a4d7;
179: mess <= 64'hcb6cb094e26dcda4;
180: mess <= 64'hb6741eeb0efc6ed5;
181: mess <= 64'h5f57eacc77e24eea;
182: mess <= 64'h05c92117a4ad67e1;
183: mess <= 64'h044a0cba14c2e9a1;
184: mess <= 64'h0384a7c67b1c2fae;
185: mess <= 64'heaf1e3018737facf;
186: mess <= 64'hb7298596546b90d7;
187: mess <= 64'h68f492c7ac73a0d8;
188: mess <= 64'h1880f4987c954b5a;
189: mess <= 64'h0daac620b2a2195b;
190: mess <= 64'hefe840e77d85713d;
191: mess <= 64'h3e3861d681573022;
192: mess <= 64'hc3b06980191b5667;
193: mess <= 64'hf025ee789cd8a241;
194: mess <= 64'h6f0dfae92d04cb30;
195: mess <= 64'h26bf065b30ad1840;
196: mess <= 64'h947ede1e272362f3;
197: mess <= 64'h67bf4d5a26a8641d;
198: mess <= 64'h9b26bf23e7e792fb;
199: mess <= 64'hbab5717c57dc0b60;
200: mess <= 64'h5ca8a5071083faec;
201: mess <= 64'h8557a8727f224d87;
202: mess <= 64'h367efff12034e705;
203: mess <= 64'h98c33efcba07eccd;
204: mess <= 64'h4f2a4a4f707fea00;
205: mess <= 64'h15d76c48df921698;
206: mess <= 64'h23a359942f06f193;
207: mess <= 64'h8c5845f911390fea;
208: mess <= 64'h1d6eedbcec514e15;
209: mess <= 64'hbad7460d388a80e3;
210: mess <= 64'h7d471b01b58cbda2;
211: mess <= 64'h7dfef4005904b9ca;
212: mess <= 64'had0138a8053685c1;
213: mess <= 64'ha5a640878bcad393;
214: mess <= 64'hb7c264173fb5ddc7;
215: mess <= 64'h2dc82a7ec5aa862d;
216: mess <= 64'hf343b535e6aa69d9;
217: mess <= 64'hc0bf81d524be98a9;
218: mess <= 64'h77bcaea63055d4c8;
219: mess <= 64'h2afd5b6722320e1b;
220: mess <= 64'he11853cb854440ef;
221: mess <= 64'h12950f54259d1db6;
222: mess <= 64'h12c3d331c7425cb0;
223: mess <= 64'h5a6c4a3f3bfc9e49;
224: mess <= 64'h85191f50fd5155cf;
225: mess <= 64'h565a06ffec011d94;
226: mess <= 64'hd57eb61516b26ff7;
227: mess <= 64'h036bbf1dd5e74ecc;
228: mess <= 64'h2dee1ccb93524f0f;
229: mess <= 64'h0aa166d2bcec032a;
230: mess <= 64'h084340c7d5c2983c;
231: mess <= 64'h5aa6511c0680115b;
232: mess <= 64'h5ce8ebbf482d5c86;
233: mess <= 64'h65c3345a8fc46a77;
234: mess <= 64'h92b49c6576dc501b;
235: mess <= 64'h1eede89685e67262;
236: mess <= 64'h1b8e3fca7a140ba2;
237: mess <= 64'hadc5aca7fb9c70ba;
238: mess <= 64'h1cef794089e165fc;
239: mess <= 64'hf71a0ccee6aca7c6;
240: mess <= 64'h3334d97d1cfe48b4;
241: mess <= 64'hddb7fc77d1a5fc72;
242: mess <= 64'h6e3ea8a7c9155b14;
243: mess <= 64'hfe555ce0eb9e191f;
244: mess <= 64'h532f3a3610a8cf34;
245: mess <= 64'h7cdb438280faa404;
246: mess <= 64'h1c1b57fc8b1d709f;
247: mess <= 64'hdd75900977f41fa0;
248: mess <= 64'h85f8875592596bee;
249: mess <= 64'h34f0aa5dd406c929;
250: mess <= 64'hf165037d93658e6d;
251: mess <= 64'hde505eaa372a526c;
252: mess <= 64'he1ef10e6e86cad0b;
253: mess <= 64'hb521ab4f294b6eab;
254: mess <= 64'h59d21f3c4fc6bed3;
255: mess <= 64'h4e7a7a846ff4391f;
endcase
end
