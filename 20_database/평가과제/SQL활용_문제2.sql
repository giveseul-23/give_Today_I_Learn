-- 1. MEMBER ���̺��� NAME �÷��� MEMBER_IDX_NAME �̶�� �ε����� ����ÿ�
CREATE INDEX MEMBER_IDX_NAME ON MEMBER(NAME);

-- 2. MEMBER ���̺�� BOARD ���̺��� �����Ͽ� MEMBER ���̺��� ���̵�, ����, ��ȭ��ȣ, �̸��ϰ� 
-- BOARD���̺��� �۹�ȣ, ����, �ۼ��� ������ ��ȸ�� �� �ִ� ��(VIEW_MEMBER_BOARD)�� ����ÿ�
CREATE VIEW VIEW_MEMBER_BOARD
AS SELECT M.ID AS ���̵�, M.NAME AS ����, M.PHONE AS ��ȭ��ȣ, M.EMAIL AS �̸���,
    B.BNO AS �۹�ȣ, B.TITLE AS ����, B.REGDATE AS �ۼ�������
FROM MEMBER M FULL OUTER JOIN BOARD B
    ON M.ID = B.ID;
    
-- ���
SELECT * FROM VIEW_MEMBER_BOARD;

-- 3. ȫ�浿�� �ۼ��� ���� MEMBER ���̺�� BOARD ���̺��� �����ؼ� ����, �� ����, �ۼ����� �ۼ��� ������ ��ȸ�Ͻÿ�.
SELECT M.NAME AS ����, B.TITLE AS ����, B.REGDATE AS �ۼ���
FROM MEMBER M INNER JOIN BOARD B
    ON M.ID = B.ID
ORDER BY �ۼ���;