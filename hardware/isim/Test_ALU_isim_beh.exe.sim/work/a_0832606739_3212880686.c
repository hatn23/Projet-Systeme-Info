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
static const char *ng0 = "/home/ise/PSI/UAL.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_10420449594411817395_1035706684(char *, char *, int , int );
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533721142_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t14[16];
    char t19[16];
    char t21[16];
    char t30[16];
    char t32[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t20;
    char *t22;
    char *t23;
    int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t33;
    char *t34;
    int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned char t42;
    unsigned char t43;
    unsigned char t44;
    unsigned char t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned char t49;
    unsigned char t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    unsigned char t55;

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 4248);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 4312);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 6436);
    t6 = xsi_mem_cmp(t1, t2, 3U);
    if (t6 == 1)
        goto LAB3;

LAB8:    t4 = (t0 + 6439);
    t7 = xsi_mem_cmp(t4, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB9:    t8 = (t0 + 6442);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB10:    t11 = (t0 + 6445);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 6452);
    t3 = (t0 + 4376);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t3);

LAB2:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2608U);
    t2 = *((char **)t1);
    t25 = (8 - 7);
    t40 = (t25 * 1U);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t3 = (t14 + 0U);
    t4 = (t3 + 0U);
    *((int *)t4) = 7;
    t4 = (t3 + 4U);
    *((int *)t4) = 0;
    t4 = (t3 + 8U);
    *((int *)t4) = -1;
    t6 = (0 - 7);
    t46 = (t6 * -1);
    t46 = (t46 + 1);
    t4 = (t3 + 12U);
    *((unsigned int *)t4) = t46;
    t4 = (t0 + 6460);
    t8 = (t19 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 7;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t7 = (7 - 0);
    t46 = (t7 * 1);
    t46 = (t46 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t46;
    t42 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t1, t14, t4, t19);
    if (t42 != 0)
        goto LAB49;

LAB51:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 4440);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB50:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2608U);
    t2 = *((char **)t1);
    t6 = (7 - 8);
    t25 = (t6 * -1);
    t40 = (1U * t25);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t42 = *((unsigned char *)t1);
    t3 = (t0 + 4504);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t42;
    xsi_driver_first_trans_fast_port(t3);
    t1 = (t0 + 4152);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(46, ng0);
    t15 = (t0 + 6448);
    t17 = (t0 + 1032U);
    t18 = *((char **)t17);
    t20 = ((IEEE_P_2592010699) + 4000);
    t22 = (t21 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 0;
    t23 = (t22 + 4U);
    *((int *)t23) = 0;
    t23 = (t22 + 8U);
    *((int *)t23) = 1;
    t24 = (0 - 0);
    t25 = (t24 * 1);
    t25 = (t25 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t25;
    t23 = (t0 + 6296U);
    t17 = xsi_base_array_concat(t17, t19, t20, (char)97, t15, t21, (char)97, t18, t23, (char)101);
    t26 = (t0 + 6449);
    t28 = (t0 + 1192U);
    t29 = *((char **)t28);
    t31 = ((IEEE_P_2592010699) + 4000);
    t33 = (t32 + 0U);
    t34 = (t33 + 0U);
    *((int *)t34) = 0;
    t34 = (t33 + 4U);
    *((int *)t34) = 0;
    t34 = (t33 + 8U);
    *((int *)t34) = 1;
    t35 = (0 - 0);
    t25 = (t35 * 1);
    t25 = (t25 + 1);
    t34 = (t33 + 12U);
    *((unsigned int *)t34) = t25;
    t34 = (t0 + 6312U);
    t28 = xsi_base_array_concat(t28, t30, t31, (char)97, t26, t32, (char)97, t29, t34, (char)101);
    t36 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t14, t17, t19, t28, t30);
    t37 = (t0 + 2608U);
    t38 = *((char **)t37);
    t37 = (t38 + 0);
    t39 = (t14 + 12U);
    t25 = *((unsigned int *)t39);
    t40 = (1U * t25);
    memcpy(t37, t36, t40);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 2608U);
    t2 = *((char **)t1);
    t25 = (8 - 7);
    t40 = (t25 * 1U);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t3 = (t0 + 4376);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 2608U);
    t2 = *((char **)t1);
    t6 = (8 - 8);
    t25 = (t6 * -1);
    t40 = (1U * t25);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t42 = *((unsigned char *)t1);
    t3 = (t0 + 4312);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t42;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t6 = (7 - 7);
    t25 = (t6 * -1);
    t40 = (1U * t25);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t44 = *((unsigned char *)t1);
    t45 = (t44 == (unsigned char)2);
    if (t45 == 1)
        goto LAB19;

LAB20:    t43 = (unsigned char)0;

LAB21:    if (t43 == 1)
        goto LAB16;

LAB17:    t42 = (unsigned char)0;

LAB18:    if (t42 != 0)
        goto LAB13;

LAB15:
LAB14:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t6 = (7 - 7);
    t25 = (t6 * -1);
    t40 = (1U * t25);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t44 = *((unsigned char *)t1);
    t45 = (t44 == (unsigned char)3);
    if (t45 == 1)
        goto LAB28;

LAB29:    t43 = (unsigned char)0;

LAB30:    if (t43 == 1)
        goto LAB25;

LAB26:    t42 = (unsigned char)0;

LAB27:    if (t42 != 0)
        goto LAB22;

LAB24:
LAB23:    goto LAB2;

LAB4:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 6450);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = ((IEEE_P_2592010699) + 4000);
    t8 = (t21 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t6 = (0 - 0);
    t25 = (t6 * 1);
    t25 = (t25 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t25;
    t9 = (t0 + 6296U);
    t3 = xsi_base_array_concat(t3, t19, t5, (char)97, t1, t21, (char)97, t4, t9, (char)101);
    t11 = (t0 + 6451);
    t15 = (t0 + 1192U);
    t16 = *((char **)t15);
    t17 = ((IEEE_P_2592010699) + 4000);
    t18 = (t32 + 0U);
    t20 = (t18 + 0U);
    *((int *)t20) = 0;
    t20 = (t18 + 4U);
    *((int *)t20) = 0;
    t20 = (t18 + 8U);
    *((int *)t20) = 1;
    t7 = (0 - 0);
    t25 = (t7 * 1);
    t25 = (t25 + 1);
    t20 = (t18 + 12U);
    *((unsigned int *)t20) = t25;
    t20 = (t0 + 6312U);
    t15 = xsi_base_array_concat(t15, t30, t17, (char)97, t11, t32, (char)97, t16, t20, (char)101);
    t22 = ieee_p_3620187407_sub_1496620905533721142_3965413181(IEEE_P_3620187407, t14, t3, t19, t15, t30);
    t23 = (t0 + 2608U);
    t26 = *((char **)t23);
    t23 = (t26 + 0);
    t27 = (t14 + 12U);
    t25 = *((unsigned int *)t27);
    t40 = (1U * t25);
    memcpy(t23, t22, t40);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2608U);
    t2 = *((char **)t1);
    t25 = (8 - 7);
    t40 = (t25 * 1U);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t3 = (t0 + 4376);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2608U);
    t2 = *((char **)t1);
    t6 = (8 - 8);
    t25 = (t6 * -1);
    t40 = (1U * t25);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t42 = *((unsigned char *)t1);
    t3 = (t0 + 4312);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t42;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t6 = (7 - 7);
    t25 = (t6 * -1);
    t40 = (1U * t25);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t44 = *((unsigned char *)t1);
    t45 = (t44 == (unsigned char)2);
    if (t45 == 1)
        goto LAB37;

LAB38:    t43 = (unsigned char)0;

LAB39:    if (t43 == 1)
        goto LAB34;

LAB35:    t42 = (unsigned char)0;

LAB36:    if (t42 != 0)
        goto LAB31;

LAB33:
LAB32:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t6 = (7 - 7);
    t25 = (t6 * -1);
    t40 = (1U * t25);
    t41 = (0 + t40);
    t1 = (t2 + t41);
    t44 = *((unsigned char *)t1);
    t45 = (t44 == (unsigned char)3);
    if (t45 == 1)
        goto LAB46;

LAB47:    t43 = (unsigned char)0;

LAB48:    if (t43 == 1)
        goto LAB43;

LAB44:    t42 = (unsigned char)0;

LAB45:    if (t42 != 0)
        goto LAB40;

LAB42:
LAB41:    goto LAB2;

LAB5:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6296U);
    t6 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t2, t1);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6312U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t4, t3);
    t10 = (t6 * t7);
    t5 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t14, t10, 8);
    t8 = (t0 + 4376);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t5, 8U);
    xsi_driver_first_trans_fast(t8);
    goto LAB2;

LAB6:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6296U);
    t6 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t2, t1);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6312U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t4, t3);
    t10 = (t6 / t7);
    t5 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t14, t10, 8);
    t8 = (t0 + 4376);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t5, 8U);
    xsi_driver_first_trans_fast(t8);
    goto LAB2;

LAB12:;
LAB13:    xsi_set_current_line(51, ng0);
    t9 = (t0 + 4248);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB14;

LAB16:    t5 = (t0 + 2312U);
    t8 = *((char **)t5);
    t10 = (7 - 7);
    t51 = (t10 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t5 = (t8 + t53);
    t54 = *((unsigned char *)t5);
    t55 = (t54 == (unsigned char)3);
    t42 = t55;
    goto LAB18;

LAB19:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t7 = (7 - 7);
    t46 = (t7 * -1);
    t47 = (1U * t46);
    t48 = (0 + t47);
    t3 = (t4 + t48);
    t49 = *((unsigned char *)t3);
    t50 = (t49 == (unsigned char)2);
    t43 = t50;
    goto LAB21;

LAB22:    xsi_set_current_line(55, ng0);
    t9 = (t0 + 4248);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB23;

LAB25:    t5 = (t0 + 2312U);
    t8 = *((char **)t5);
    t10 = (7 - 7);
    t51 = (t10 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t5 = (t8 + t53);
    t54 = *((unsigned char *)t5);
    t55 = (t54 == (unsigned char)2);
    t42 = t55;
    goto LAB27;

LAB28:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t7 = (7 - 7);
    t46 = (t7 * -1);
    t47 = (1U * t46);
    t48 = (0 + t47);
    t3 = (t4 + t48);
    t49 = *((unsigned char *)t3);
    t50 = (t49 == (unsigned char)3);
    t43 = t50;
    goto LAB30;

LAB31:    xsi_set_current_line(63, ng0);
    t9 = (t0 + 4248);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB32;

LAB34:    t5 = (t0 + 2312U);
    t8 = *((char **)t5);
    t10 = (7 - 7);
    t51 = (t10 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t5 = (t8 + t53);
    t54 = *((unsigned char *)t5);
    t55 = (t54 == (unsigned char)3);
    t42 = t55;
    goto LAB36;

LAB37:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t7 = (7 - 7);
    t46 = (t7 * -1);
    t47 = (1U * t46);
    t48 = (0 + t47);
    t3 = (t4 + t48);
    t49 = *((unsigned char *)t3);
    t50 = (t49 == (unsigned char)3);
    t43 = t50;
    goto LAB39;

LAB40:    xsi_set_current_line(67, ng0);
    t9 = (t0 + 4248);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB41;

LAB43:    t5 = (t0 + 2312U);
    t8 = *((char **)t5);
    t10 = (7 - 7);
    t51 = (t10 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t5 = (t8 + t53);
    t54 = *((unsigned char *)t5);
    t55 = (t54 == (unsigned char)2);
    t42 = t55;
    goto LAB45;

LAB46:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t7 = (7 - 7);
    t46 = (t7 * -1);
    t47 = (1U * t46);
    t48 = (0 + t47);
    t3 = (t4 + t48);
    t49 = *((unsigned char *)t3);
    t50 = (t49 == (unsigned char)2);
    t43 = t50;
    goto LAB48;

LAB49:    xsi_set_current_line(82, ng0);
    t9 = (t0 + 4440);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB50;

}

static void work_a_0832606739_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(91, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4568);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4168);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0,(void *)work_a_0832606739_3212880686_p_1};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/Test_ALU_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
