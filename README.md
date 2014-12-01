mrcal-ps1
=========

Skeleton code to generate and manipulate machine-readable one year calendar.

�@�B�ǂȔN�ԃJ�����_�[�𐶐����邽�߂̃X�P���g���R�[�h�ł��B
�኱�A��ЃJ�����_�[�̍쐬�����ł��B

License
-------

zlib License.

Target environments
-------------------

Windows with PowerShell 2.0 or later.

PowerShell 2.0�ȍ~�𗘗p�\��Windows���Ŏg�p�ł��܂��B
����������ł�Windows 7 + PowerShell 2.0�̑g�ݍ��킹�ł�������m�F���Ă��܂���B

Set up
------

1. Put all files in a directory.
2. Modify mrcal\_cfg.ps1.
3. (Optional) Modify `With-RegularHoliday` in mrcal.ps1.

1. �S�t�@�C����K���ȃt�H���_�ɃR�s�[���Ă����܂��B
2. mrcal\_cfg.ps1�̒��g�𒲐����܂��B
    * �쐬����J�����_�[�̐���E�J�n���E���ԂƁA�x���ƌ��Ȃ����̃e�[�u���𒲐����Ă��������B
    * NATIONAL\_HOLIDAY�i�j���j�ɂ��ẮA���t�{�̏j���ꗗ����R�s�[���Ă��܂��B
        * �u�����̏j���Ɋւ���@���v�̃A���S���Y���������ʓ|���������߁B
        * �t���̓��ƏH���̓��͑O�N�̊���Ō��\�����̂ŃA���S���Y�����ł��Ȃ��A�Ƃ������R������܂��B
    * NOT\_HOLIDAY�ɓo�^�������́A�x���ł͂Ȃ��ƌ��Ȃ���܂��B
        * �N�ԉғ����̓s���ŗ�O�I�ɏo�Γ������������A�Ƃ����P�[�X�Ŏg���܂��B
    * PAID\_TIME\_OFF\_DAY�͔N���L���x�ɂ̌v��I�t�^�i���Ɉ�ĕt�^�j�̎��Ɏg�p���Ă��������B
3. �K�v�ɉ�����mrcal.ps1�� `With-RegularHoliday` ���C�����Ă��������B
    * �X�P���g���R�[�h�ł́A�@�B�I�ɓy�����x���ƌ��Ȃ��Ă��܂��B
    * mrcal\_cfg.ps1��NOT\_HOLIDAY�� `With-RegularHoliday` �̎����Ŋy�����邽�߂̎d�|���������肵�܂��B

Usage
-----

See \`Example'.

mrcal.ps1�ŃJ�����_�[�𐶐����܂��B
���������J�����_�[��XML�iCLiXML�j�ł��B
System.DateTime�̃I�u�W�F�N�g�Ɏ��̃v���p�e�B��ǉ����ăV���A���C�Y�����Ă��܂��B

Holiday
: �x���i�N���L���x�ɂ̌v��I�t�^���܂ށj�Ȃ�$true�B
PaidTimeOff
: �N���L���x�ɂ̌v��I�t�^�ɂ��x�݂Ȃ�$true�B

��L�v���p�e�B�́A�o�͂��ꂽ�J�����_�[�𒼐ڕҏW���ĕύX���邱�Ƃ��\�ł��B

to\_tsv.ps1�́A�������ꂽ�J�����_�[�𑀍삷��T���v���R�[�h�ł��B
���t�Ƌx���֘A�̃v���p�e�B�݂̂𒊏o���āATSV�`���ŏo�͂��܂��B

���b�p�[�̃o�b�`�t�@�C���imrcal.bat�Ato\_tsv.bat�j���p�ӂ��Ă���܂��B
�R�}���h�v�����v�g�g���̐l�́A��������g�p���������y��������܂���B

Example
-------

```PowerShell
## Generate calendar
.\mrcal.ps1 calendar.xml

## Convert calendar to TSV
.\to_tsv.ps1 calendar.xml | more
```
