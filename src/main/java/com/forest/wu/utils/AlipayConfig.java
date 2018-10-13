package com.forest.wu.utils;

public class AlipayConfig {
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	//同步跳转的地址
	public static String return_url = "http://localhost:8080/calculate/success";
	//异步通知地址
	public static String notify_url = "http://localhost:8080/calculate/notify";
	public static String app_id = "2016092100566200";
	public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCjt8OagiUtoCNCBS1uf9Mvey3WIuS+jUjmrB0xveBvH9ybmW+g4AAwLet7eiSUhSW+41ov5Vw7oW/jtWZzwCT7A5kADQ3i2OUhh5GbmXYMpBaXpm9Ln31F7JjMcPYP5eMVHZvAr/i9eyMCh7z3N2XOi6KmiAuYtzfhcNycTWZwRnD/bvkyf3tJY6gh0tvH6JmfVTsApdWsy4jxOdPbOzAgGZgnqxgMhawqfaCp93x/+4m5DnxpXU48rSI2IoMsmCrLNFFG7N9cLTlff/z3VHGwIrsaA9ZbFjBwM/e2453AqMG+ky9+ztoWfaMDxZoqmykzuWCyUqeHRtfTZG7dMn1PAgMBAAECggEBAJkH7WugWTYjqLFOe5/9FZ8dScQOi7heAhW0LfnP3Vih9KjxLDm5CBQA6Etb6ZN2PckHZMa+Yo9OoHK9ng12PlrvivVUPnWbfdnwibdjI8g/HOsV5JRQeV2CAXWf5TEJFlEngu4CzsP2tMvpq0V938jIFvoI0qYmJLKyt1PWuXkZrKf5HfABlRMLh8gtWn4HDJDWaGoO8+eO9uXeRDxc8N0Y0NYoFeDVtUkS+H6SFBA6m88uEy9OSRt3J5rOBimSU5M/G8Ivhu5otMbVXE5MA37n3A/u8UeQ57/77oA380xLlJEW+wgDjPt7+fSREcdDrCoPBZgWQ9NJ7uq79Rpf+PkCgYEA6wL+NP136a5bckKMtgIGFVXMlqytf7zb4NGzIA0sDitlwFQB7M4DHOIwNlt+P1FyL+Sro6R/Ov3ccQN+9SlqDWVv/ecYVI+uq0IfnP/wBUsN/cIiQAniSkdOjX+kANu1Pcu6DtSigDlmL8lFogKDcR1bFWrAVF9ub6WObzVfrBMCgYEAslbMnujE99MvyCq3bsLsgZaNa+5F6hWErEk+hcqvmaqtbKgzJFQLxqNZRde6zwXMCwTooYrPp+4ltYGqN1aC1ryqd1VNXULAqV85Wux87PYgrusXAIHP0/PQ7GC4Ac6pPBNlW1vHAbQqw3VcVXJcDDpguCVKwYqA75eDstPtmVUCgYAfune3j8Dwu6l8858rs3o+xyan8Qg7hrPo1mbonN6lyxYhsTXRUr7411DLBe81fTl9XdIOddb3j+6DE4XAc6btyBQmo1yVjhB27qZ1+9fb3xY0fFFDdBIpFRd14xWxR/hgL3EfL3YA+b7iFLph9RTp4Jy7d34f5gJy8FcajIouIQKBgAx1J8IJ/IhbRkEzSrEACMlcnPBnKpcZfbUTQLzT1cRkOc0XSstE27W6f2fzk+cWPpSeeSmfqrXOWu/86MkI0Ab0EuxXFxpmqVKrhjQlxOxAnTPa1DaC2uOxamy4rOHjb8r0h+YD2TjzPvF8Z0DIxklMYqk6Yah3Zl5WNSruxvApAoGAXqjl+ZXCz09meq74MGjtZeChoN2TXRqhn72xS6g5CcwaJt/FWVpjZDlpIAwitvcoOHssUcE+e0IurCeUlx2OA91GT2E3fwjE46I0FaB0jPlted/IaB7oe4/LsgSZVxABhZa8Dv1dYnp3jlw9uzupSA4i6BobBjmN+yZRwZOSxig=";
	public static String charset = "utf-8";
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo7fDmoIlLaAjQgUtbn/TL3st1iLkvo1I5qwdMb3gbx/cm5lvoOAAMC3re3oklIUlvuNaL+VcO6Fv47Vmc8Ak+wOZAA0N4tjlIYeRm5l2DKQWl6ZvS599ReyYzHD2D+XjFR2bwK/4vXsjAoe89zdlzouipogLmLc34XDcnE1mcEZw/275Mn97SWOoIdLbx+iZn1U7AKXVrMuI8TnT2zswIBmYJ6sYDIWsKn2gqfd8f/uJuQ58aV1OPK0iNiKDLJgqyzRRRuzfXC05X3/891RxsCK7GgPWWxYwcDP3tuOdwKjBvpMvfs7aFn2jA8WaKpspM7lgslKnh0bX02Ru3TJ9TwIDAQAB";
	public static String sign_type = "RSA2";
}