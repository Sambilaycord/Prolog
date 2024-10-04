% Find GCD
gcd(A, 0, A) :- A > 0, !.
gcd(A, B, G) :-
    B > 0,
    R is A mod B,
    gcd(B, R, G).

% Simplify a fraction
simplify_fraction(N, D, N1, D1) :-
    gcd(N, D, G),
    N1 is N // G,  % Divide numerator by GCD
    D1 is D // G.  % Divide denominator by GCD

% Adding Fraction Predicate
addFraction(W, N, D, N1, D1, N2, D2) :-
    % Calculate the numerator and denominator
    Num is N1 * D2 + N2 * D1,
    Denom is D1 * D2,

    % Simplify the fraction
    simplify_fraction(Num, Denom, NumSimplified, DenomSimplified),

    % Convert to a mixed number
    W is NumSimplified // DenomSimplified,
    NTemp is NumSimplified mod DenomSimplified,

    % Set the numerator and denominator for the fraction part
    ( NTemp =:= 0 ->
        N = 0, D = 1
    ;
        N = NTemp, D = DenomSimplified
    ).
