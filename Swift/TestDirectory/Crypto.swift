//
//  Crypto.swift
//  PacificOcaen
//
//  Created by Vlad Lesnichiy on 5.07.24.
//


import Foundation
import CryptoKit
import Security

struct RsaKeys {
    let privateKey: SecKey?
    let publicKey: SecKey?

    init() {
        let attributes: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeySizeInBits as String: 2048,
        ]
        guard
            let privateKey: SecKey = SecKeyCreateRandomKey(attributes as CFDictionary, nil),
            let publicKey: SecKey = SecKeyCopyPublicKey(privateKey)
        else {
            self.privateKey = nil
            self.publicKey = nil
            return
        }
        self.privateKey = privateKey
        self.publicKey = publicKey
    }
}

struct CryptoTest {

    init() {
        let rsaKeys = RsaKeys()
        print(rsaKeys.privateKey)
        print(rsaKeys.publicKey)
        print()

        if let publicKeyPEM = secKeyToPEM(rsaKeys.publicKey!) {
            print("Ключ в формате PEM:")
            print(publicKeyPEM)
        } else {
            print("Не удалось преобразовать ключ в формат PEM")
        }


        let dataToEncrypt: Data = "Hello, World!".data(using: .utf8)!
        print("dataToEncrypt: \(dataToEncrypt)")

        let encryptedData = encryptData(data: dataToEncrypt, publicKey: rsaKeys.publicKey!)
        let decryptedData = decryptData(encryptedData: encryptedData!, privateKey: rsaKeys.privateKey!)
        let decryptedString = String(data: decryptedData!, encoding: .utf8)
        print(decryptedString)
    }

    /// Шифрование данных с использованием открытого ключа
    func encryptData(data: Data, publicKey: SecKey) -> Data? {
        return SecKeyCreateEncryptedData(publicKey, .rsaEncryptionOAEPSHA256, data as CFData, nil) as? Data
    }
    /// Дешифрование данных с использованием закрытого ключа
    func decryptData(encryptedData: Data, privateKey: SecKey) -> Data? {
        return SecKeyCreateDecryptedData(privateKey, .rsaEncryptionOAEPSHA256, encryptedData as CFData, nil) as? Data
    }

    func secKeyToPEM(_ key: SecKey) -> String? {
        var error: Unmanaged<CFError>?
        guard let data = SecKeyCopyExternalRepresentation(key, &error) as Data? else {
            print("Ошибка при получении внешнего представления ключа: \(error!.takeUnretainedValue() as Error)")
            return nil
        }

        let pemString = data.base64EncodedString()
        return """
    -----BEGIN PUBLIC KEY-----
    \(pemString)
    -----END PUBLIC KEY-----
    """
    }
}

