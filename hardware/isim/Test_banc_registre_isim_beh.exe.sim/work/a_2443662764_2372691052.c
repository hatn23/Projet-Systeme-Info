/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/PSI/Test_banc_registre.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_16272557775307340295_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_2443662764_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3584U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 4216);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 4216);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2443662764_2372691052_p_1(char *t0)
{
    char t13[16];
    char t22[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    int t21;
    char *t23;

LAB0:    t1 = (t0 + 3832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(103, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3640);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 10);
    t2 = (t0 + 3640);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 4280);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 3);
    t2 = (t0 + 3640);
    xsi_process_wait(t2, t5);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 4280);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 6856);
    t6 = (t0 + 4344);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 6864);
    t6 = (t0 + 4408);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 4U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 3);
    t2 = (t0 + 3640);
    xsi_process_wait(t2, t5);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 6868);
    *((int *)t2) = 0;
    t4 = (t0 + 6872);
    *((int *)t4) = 14;
    t11 = 0;
    t12 = 14;

LAB20:    if (t11 <= t12)
        goto LAB21;

LAB23:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4472);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 6876);
    t6 = (t0 + 4536);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 4U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 6880);
    t6 = (t0 + 4600);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 4U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 3);
    t2 = (t0 + 3640);
    xsi_process_wait(t2, t5);

LAB35:    *((char **)t1) = &&LAB36;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB21:    xsi_set_current_line(119, ng0);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t6 = (t0 + 6752U);
    t8 = ieee_p_3620187407_sub_16272557775307340295_3965413181(IEEE_P_3620187407, t13, t7, t6, (unsigned char)3);
    t9 = (t13 + 12U);
    t14 = *((unsigned int *)t9);
    t15 = (1U * t14);
    t16 = (8U != t15);
    if (t16 == 1)
        goto LAB24;

LAB25:    t10 = (t0 + 4344);
    t17 = (t10 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t8, 8U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t2 = (t0 + 6736U);
    t6 = ieee_p_3620187407_sub_16272557775307340295_3965413181(IEEE_P_3620187407, t13, t4, t2, (unsigned char)3);
    t7 = (t13 + 12U);
    t14 = *((unsigned int *)t7);
    t15 = (1U * t14);
    t16 = (4U != t15);
    if (t16 == 1)
        goto LAB26;

LAB27:    t8 = (t0 + 4408);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t17 = (t10 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 4U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 4472);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 3);
    t2 = (t0 + 3640);
    xsi_process_wait(t2, t5);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB22:    t2 = (t0 + 6868);
    t11 = *((int *)t2);
    t4 = (t0 + 6872);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB23;

LAB32:    t21 = (t11 + 1);
    t11 = t21;
    t6 = (t0 + 6868);
    *((int *)t6) = t11;
    goto LAB20;

LAB24:    xsi_size_not_matching(8U, t15, 0);
    goto LAB25;

LAB26:    xsi_size_not_matching(4U, t15, 0);
    goto LAB27;

LAB28:    goto LAB22;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB33:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 6884);
    *((int *)t2) = 0;
    t4 = (t0 + 6888);
    *((int *)t4) = 7;
    t11 = 0;
    t12 = 7;

LAB37:    if (t11 <= t12)
        goto LAB38;

LAB40:    xsi_set_current_line(139, ng0);

LAB52:    *((char **)t1) = &&LAB53;
    goto LAB1;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

LAB38:    xsi_set_current_line(133, ng0);
    t6 = (t0 + 4472);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t2 = (t0 + 6704U);
    t6 = (t0 + 6892);
    t8 = (t22 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 3;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t21 = (3 - 0);
    t14 = (t21 * 1);
    t14 = (t14 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t14;
    t9 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t13, t4, t2, t6, t22);
    t10 = (t13 + 12U);
    t14 = *((unsigned int *)t10);
    t15 = (1U * t14);
    t16 = (4U != t15);
    if (t16 == 1)
        goto LAB41;

LAB42:    t17 = (t0 + 4536);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t23 = *((char **)t20);
    memcpy(t23, t9, 4U);
    xsi_driver_first_trans_fast(t17);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 6720U);
    t6 = (t0 + 6896);
    t8 = (t22 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 3;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t21 = (3 - 0);
    t14 = (t21 * 1);
    t14 = (t14 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t14;
    t9 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t13, t4, t2, t6, t22);
    t10 = (t13 + 12U);
    t14 = *((unsigned int *)t10);
    t15 = (1U * t14);
    t16 = (4U != t15);
    if (t16 == 1)
        goto LAB43;

LAB44:    t17 = (t0 + 4600);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t23 = *((char **)t20);
    memcpy(t23, t9, 4U);
    xsi_driver_first_trans_fast(t17);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 3);
    t2 = (t0 + 3640);
    xsi_process_wait(t2, t5);

LAB47:    *((char **)t1) = &&LAB48;
    goto LAB1;

LAB39:    t2 = (t0 + 6884);
    t11 = *((int *)t2);
    t4 = (t0 + 6888);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB40;

LAB49:    t21 = (t11 + 1);
    t11 = t21;
    t6 = (t0 + 6884);
    *((int *)t6) = t11;
    goto LAB37;

LAB41:    xsi_size_not_matching(4U, t15, 0);
    goto LAB42;

LAB43:    xsi_size_not_matching(4U, t15, 0);
    goto LAB44;

LAB45:    goto LAB39;

LAB46:    goto LAB45;

LAB48:    goto LAB46;

LAB50:    goto LAB2;

LAB51:    goto LAB50;

LAB53:    goto LAB51;

}


extern void work_a_2443662764_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2443662764_2372691052_p_0,(void *)work_a_2443662764_2372691052_p_1};
	xsi_register_didat("work_a_2443662764_2372691052", "isim/Test_banc_registre_isim_beh.exe.sim/work/a_2443662764_2372691052.didat");
	xsi_register_executes(pe);
}
