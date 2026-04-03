;; nft.clar Non-Fungible Token

(define-non-fungible-token nft uint)

(define-data-var last-token-id uint u0)
(define-data-var base-uri (string-ascii 256) "https://api.example.com/metadata/{id}")

(define-constant CONTRACT_OWNER tx-sender)
(define-constant COLLECTION_LIMIT u1000)
(define-constant ERR_OWNER_ONLY (err u100))
(define-constant ERR_NOT_TOKEN_OWNER (err u101))
(define-constant ERR_SOLD_OUT (err u300))

(define-read-only (get-last-token-id) (ok (var-get last-token-id)))
(define-read-only (get-token-uri (token-id uint)) (ok (some (var-get base-uri))))
(define-read-only (get-owner (token-id uint)) (ok (nft-get-owner? nft token-id)))

(define-public (set-base-uri (value (string-ascii 256)))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_OWNER_ONLY)
        (var-set base-uri value)
        (ok (print {
              notification: "token-metadata-update",
              payload: {
                token-class: "nft",
                contract-id: current-contract,
              }
            }))))

(define-public (transfer (token-id uint) (sender principal) (recipient principal))
  (begin
    (asserts! (or (is-eq tx-sender sender) (is-eq contract-caller sender)) ERR_NOT_TOKEN_OWNER)
    (nft-transfer? nft token-id sender recipient)))

(define-public (mint (recipient principal))
  (let ((token-id (+ (var-get last-token-id) u1)))
    (asserts! (< (var-get last-token-id) COLLECTION_LIMIT) ERR_SOLD_OUT)
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_OWNER_ONLY)
    (try! (nft-mint? nft token-id recipient))
    (var-set last-token-id token-id)
    (ok token-id)))
